import * as path from 'path';
import * as fs from 'fs';
import * as _ from 'lodash';
import * as mapValuesDeep from "map-values-deep-lodash";

let startDir = "./src";
let templateFile = "template.json";
let outputDir = "./dist"

let template = path.join(startDir, templateFile);
var outputObject = JSON.parse(fs.readFileSync(template).toString());

//console.log(outputObject);
if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir);
}
let regex = /\%(.+)\%/;



outputObject = mapValuesDeep(outputObject, (value: string) => {
    if (regex.test(value)) {
        let result = value.match(regex);
        var file = result[1];
        console.log(`Replacing with content of ${path.join(startDir, file)}`)
        return fs.readFileSync(path.join(startDir, file)).toString();
    }
    return value;
});


fs.writeFileSync(path.join(outputDir, templateFile), JSON.stringify(outputObject, null, 2))


