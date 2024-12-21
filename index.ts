import * as core from '@actions/core';
import { default as package_ } from './package.json' with { type: 'json' };

core.info(`${package_.name} version v${package_.version}`);

const requiredVar = core.getInput('required_var', { required: true });
const optionalVar = core.getInput('optional_var');

core.startGroup('Inputs');
core.info(`required-var: ${requiredVar}`);
core.info(`optional-var: ${optionalVar}`);
core.endGroup();

core.setOutput('result', 'Great success!');
