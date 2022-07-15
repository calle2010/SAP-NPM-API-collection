# Change Log
All notable changes to this project are documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/) and the changelog is formatted based on [Keep a Changelog](http://keepachangelog.com/).

## [1.6.6] - 2022-07-07
### Added
- Added ability to import and export saved ABAP On-premise SAP Systems when using VSCode. Credential information is not exported and users therefore need to re-authenticate when importing.

### Fixed
- Fixed issue where saving an SAP System in VSCode would crash if the system name was not provided.
- Fixed issue with back navigation when adding deployment configuration in SAP Business Application Studio.
 
## [1.6.4] - 2022-06-23
### Added
- Added a check when using a destination in SAP Business Application Studio with the Fiori generator to ensure that the destination catalog service(s) can be found.

#### Changed
- Changed deployment configuration with clear text and hints whilst enforcing transport request validation where applicable.

### Fixed
- Fixed issue where an invalid saved SAP System in Windows was not displaying the correct error message.
- Fixed ABAP deployment issue where user could be asked to re-authenticate against backend even if they had already authenticated successfully.

## [1.6.3] - 2022-06-09
### Added
- The list of minimum SAPUI5 versions available during project generation are now grouped into `maintained versions` and `out of maintenance versions` for easy reference.
- Added a check when deploying to an existing SAPUI5 ABAP repository with a new SAP App ID.  Previously the deployment would overwrite the existing one, now the user is asked to confirm the overwrite.

### Fixed
- Fixed an issue where the CDS watch script for an SAP Fiori application in a Node.js CAP project was not getting created.
- Fixed an issue where the previews are failing for a Fiori Freestyle application when created with Data Source as `None`.
- Fixed an issue where the reuse library referenced in an existing project was not being loaded from the local workspace.

## [1.6.1] - 2022-05-26
### Added
- Added unique non-identifable `toolsId` identifer to the manifest.json file for generated projects to support telemetry.

#### Changed
- Updated validation of Node.js CAP data sources to detail if the compilation of the services failed.
- Improved the error message when an OData service URL provided does not reference an OData service.

### Fixed
- Fixed issue when using API Business Hub in SAP Business Application Studio with local preview.
- Fixed issue where the Generator would not follow http redirects for an OData service URL.

## [1.6.0] - 2022-05-12
### Added
- Added support for the SAP Fiori elements Overview Page floorplan with an OData V4 data source.
- Added Ability to generate Cloud Foundry deployment configuration for an existing SAP Fiori project in a non-interactive mode.

#### Changed
- Updated the launch targets generated for a SAP Fiori application in VSCode to remove those allowing you to specify an SAPUI5 version at runtime.  Please use the Fiori Run Configurations tool to change the version of SAPUI5 needed.
 
### Fixed
- Fixed issue where adding an SAP Fiori application to a JAVA Cap Project may fail to start if the relevant plugins and configuration were not already present in the project. These updates are now added as part of generation if needed.
- Fixed the Form Entry Object Page floorplan to only accept OData V4 services.

## [1.5.5] - 2022-04-28
### Added
- Added support for the SAP Fiori elements Worklist floorplan with an OData V4 data source.

#### Changed
- Adding a new system during generation will now display the username of the user after authentication to the system.
- The deployment name is no longer automatically populated from the module name when adding deployment configuration.

### Fixed
- Fixed CAP services retrieval to support services defined in nested folders in CAP projects.

## [1.5.4] - 2022-04-14
### Added
- Added support for instance based destinations in deployment configuration for local Node.js CAP projects in SAP Business Application Studio.

#### Changed
- Fiori generator for application type `SAP Fiori elements` now consumes the open source SAP Fiori elements templates published [here](https://github.com/SAP/open-ux-tools).

### Fixed
- Fixed bug where VSCode launch configuration would not start the project correctly in certain situations.
- Fixed issue where the Fiori generator would allow the user to continue if the mandatory navigation entity was not selected.

## [1.5.3] - 2022-03-31
### Added
- Added support for creating new saved SAP systems in VSCode.  Users can click on the '+' icon and select to create an ABAP on Premise or ABAP Environment on SAP Business Technology Platform saved system.  Users must test the connection to validate it connects before saving.

#### Changed
- Determining if telemetry data is to be captured during generation is now determined from the global SAP Fiori tools setting in the command palette: `Fiori: Change Telemetry Settings`.

### Fixed
- Fixed bug where message longtexts were not displayed in the console for ABAP deployment errors.  These can be copied and pasted into the browser for more details.
- Fixed bug where the SAP Fiori generator could crash if the project folder location was read-only.
- Fixed error where SAP Fiori freestyle projects with an uploaded metadata file were not being validated correctly.

## [1.5.2] - 2022-03-17
### Fixed
- Fixed invalid xs-security.json file location when using generator in non-interactive mode for CAP projects.
- Fixed launch configurations in VSCode when the Fiori project is generated inside an MTA subfolder.
- Fixed bug where App Router configuration needed to be added to an MTA.yaml file before Fiori deployment configuration.
- Fixed issue with deployment errors containing longtext messages that did not have the associated URL clickable.

## [1.5.1] - 2022-03-03
#### Added
- Added warning during deployment if deploying to an ABAP system that uses a lower version of SAPUI5 than that specified as the minimum SAPUI5 version in the SAP Fiori project being deployed.

#### Changed
- Added entity selection details to the `README.md` file for a generated SAP Fiori application.

### Fixed
- Fixed issue with generated applications not working with SAPUI5 versions greater than or equal to 1.100.0
- The `start-variants-management` script will not be available if the SAP Fiori project was generated by uploading a metadata document rather than using a live service.

## [1.5.0] - 2022-02-17
#### Added
- Added support for editing saved SAP systems in VSCode by selecting the saved system from the SAP Systems list and updating as needed.  Users must test the connection to validate it connects before saving.
- Added support for matching the suggested minimum SAPUI5 version with the backend ABAP system, where applicable.  The SAPUI5 version dropdown will now default to the same version of SAPUI5 if the data source provided is an ABAP backend and the SAPUI5 version can be determined. 

#### Changed
- Removed the `Latest` label from the list of minimum SAPUI5 versions.  The version of SAPUI5 choosen during generation will now be a fixed version from that selected.
- Generated applications with a OData V2 data source now use an external mockserver for mock support, rather than the SAPUI5 client side mock.

### Fixed
- The generated `README.md` file now correctly details if the application was generated with the Fiori elements or Fiori freestlye generator.

## [1.4.7] - 2022-02-03
#### Changed
- Updated the `Analytical List Page` floorplan, when used with an V4 OData service, to now only support version 1.90 and above of SAPUI5.  This enables the generated project to adhere to the latest recommended configuration.
- Updated the local preview `npm` targets to not use the browser cache to ensure the latest updates are being reflected in the browser.
- Removed unneeded i18n references from the generated manifest file.

### Fixed
- Fixed an issue where the Fiori generator would crash if attempting to connect to an on-premise system using SAML in VSCode.

## [1.4.6] - 2022-01-20
#### Added
- Generating an SAP Fiori freestyle application will launch the `Application Info` page for that application after generation completes. 

#### Changed
- The SAP Fiori freestyle template `SAP Fiori Master-Detail Application` has been renamed `SAP Fiori List-Detail Application`.

### Fixed
- Starting your SAP Fiori application from the launch/debug configuration with a specified version of UI5 will now use that specific version of UI5.
- Fixed linting errors displayed after application is deployed.
- SAP Fiori freestyle applications generated with a CAP project no longer identify as SAP Fiori elements applications within the SAP Fiori tools suite.

## [1.4.4] - 2021-12-09
#### Added
- Added support for the experimental SAP Horizon theme, as long as a supported version of UI5 is selected during generation.

#### Changed
- Choosing the UI5 version for your application is no longer under `Advanced Options` and is now directly on the `Project Attributes` step for better visibility.

### Fixed
- Selecting a Fiori freestyle SAPUI5 template with no datasource no longer crashes the generator.
- Performing a test deployment no longer reports the result as an error unless the test deployment fails.

## [1.4.3] - 2021-11-25
#### Added
- A new SAP Fiori elements floor plan is now available.  The `Form Entry Object Page` floor plan for V4 OData sources allows you to create an SAP Fiori application with an object page for data entry.
- The `List Report Object Page` floor plan and the new `Form Entry Object Page` floor plan can now optionally generate UI annotations during generation if there are none already available in the supplied data source.  **Note:** This is an experimental feature and can be switched off by disabling the `Sap › Ux › Application Modeler: Enable Experimental Features` option in the settings.

#### Changed
- Generated applications now use the Fiori CLI in the generated launch configuration to start the application.

### Fixed
- Fixed crash in the `CF Application Router` generator if an MTA ID with invalid characters is provided.
- Using the SAP Fiori generator from the command line in Business Application Studio now supports data sources using the API Business Hub.
- Generating a SAP Fiori freestyle application into a CAP project with an `mta.yaml` file should now launch successfully.
- Using a Java CAP project with the SAP Fiori generator no longer requires a `package.json` file in the root folder.

## [1.4.1] - 2021-11-11
#### Added
- Generating an Analytical List Page application with an OData V4 data source will now default to a table type of `AnalyticalTable`, and the user will no longer be asked to choose a table type.  The user can change this table type after generation using the Page Editor tool.

#### Changed
- Fiori generator for application type `SAPUI5 freestyle` now consumes the open source Freestyle templates published [here](https://github.com/SAP/open-ux-tools).

### Fixed
- Saved SAP systems should not ask the user to re-authenticate when being used with the Fiori generator in VSCode, unless needed.

## [1.4.0] - 2021-10-28
#### Added
- UUA Authentication is now supported during deployment without launching a browser, as long as the relevant authentication parameters are supplied. See the SAP Fiori tools help portal for full details.

### Fixed
- Generating an application into a CAP project no longer adds unnecessary npm dependencies.
- Destinations in SAP Business Application Studio are now filtered to show only those that can be used in the generator.

## [1.3.7] - 2021-10-14
#### Added
- A new npm script for ABAP deployment configuration has been added, `deploy-test`.  Using this target will allow you to validate your deployment configuration without actually deploying.

## [1.3.6] - 2021-10-07
### Fixed
- OData services that require a querystring parameter in the URL are now supported.

## [1.3.5] - 2021-09-30
#### Added
- The Fiori command line tools now has help context information available.  Typing `npx fiori help` will give the user a list of commands that the Fiori command line tools support.  Help text for individual Fiori commands can also be displayed, e.g. `npx fiori add help`.

### Fixed
- Adding deployment configuration to a Fiori application with an existng MTA project should now successfully update the `mta.yaml` and `package.json` files in the parent folder.
- Fixed standalone deployment configuration for Cloud Foundry destinations.
- The Fiori generator no longer crashes if the Cloud Foundry account does not match that configured in SAP Business Application Studio.

## [1.3.3] - 2021-09-16
#### Added
- The generator now supports optionally adding eslint validation to the generated project.  Choosing this option from the advanced options of the generator will add the eslint libraries and a new target `npm run lint` to perform the validation.
- ABAP deployment now allows the user to provide a project ZIP file from either the local filesystem or from a remote URL.
- Successful deployment to Cloud Foundry will provide instructions on how to retreive the URL of the deployed application.
- Using the `CF Application Router Generator` for generating a multi-targeted application no longer asks for the version of the MTA, but will default to `0.0.1` in the generated `mta.yaml` file.

### Fixed
- Better handling for destinations with SAML authentication.
- Deployment logic updated to ensure only files in the `dist` folder are uploaded.
- Better support for long MTA identifier names during Cloud Foundry deployment.
- Improved support for project folders with spaces with the generator.

## [1.3.2] - 2021-09-02
#### Added
- Added ability to optionally include UI5 code assistance libraries to the generated application by choosing it in the advanced options of the generator.
- Using a Saved System in VSCode will now ask the user to re-authenticate if the saved credentials are no longer valid.

### Fixed
- Fixed an issue which caused the Fiori generator to crash when connecting to a Cloud Foundry service if the SAP Business Application Studio subaccount is not the same as the Cloud Foundry organisation.

## [1.3.1] - 2021-08-19
#### Added
- Added support for generating Fiori applications using the SAP API Business Hub from the Service Center in Business Application Studio.
- Non identifiable and optional telemetry data has been added for deployment.

### Fixed
- The `minUI5Version` version in the generated `manifest.json` file now details the UI5 version used during generation.
- Improved support for detecting Reuse libraries in the local workspace.

## [1.3.0] - 2021-07-28
### Fixed
- Fixed an issue which caused the Fiori generator to crash due to presence of multiple schemas in the metadata file
- Fixed an issue where generated project was missing undeploy script when deploy config was created for Cloud Foundry environment
- Fixed an issue where the cloned reuse library with missing description in i18 file was not being listed for being added as a reference


## [1.2.5] - 2021-07-22
#### Added
- Added support for Cloud Foundry deployment configuration during non-interactive generation.

### Fixed
- Better support for determining if pre-requisite `mta` library is installed before attempting to add Cloud Foundry deployment configuration.
- Removed erroneous telemetry error messages when using the generator from the command line.
- Fixed the deployment name character restrictions for ABAP deployment. 

## [1.2.4] - 2021-07-08
#### Added
- Destinations configured with a service URL endpoint, or a hostname, can now be used with the Fiori generator in Business Application Studio.
- Reuse components and libraries in the local workspace can now be added to your project.  Use the command palette entry `Fiori: Add Reference to SAP Fiori Reusable Libraries` to invoke this functionality.

### Fixed
- In Business Application Studio, the Cloud Foundry Destination dropdown in the Deployment Configuration step of the Generator should now successfully return all available destinations.

## [1.2.3] - 2021-06-24
#### Added
- Deploying to a system that requires authentication will now prompt for a username and password if a local `.env` file with the credentials is not present.
- Installing the generator in a custom location is now supported.

### Fixed
- Freestyle applications generated for a CAP project will no longer contain invalid test artefacts.
- The `start-local` npm target now works with the SAP Belize theme.
- Deleting a saved SAP system from VSCode now also deletes the authentication token from the secure storage.
- Deployed Fiori elements applications now correctly display the application title.

## [1.2.1] - 2021-06-10
#### Added
- Added support for the Service Center in Business Application Studio.  Services selected in the Service Center can now be used with the Fiori generator and the user will not be asked to provide a data source during generation, the selected service from the Service Center will be used instead.
- Added support for Destinations in Business Application Studio that have been configured with a service endpoint URL rather than a catalog service.

### Fixed
- Requesting authentication for a saved system in VSCode no longer launches multiple browsers to authenticate. Only one browser should now open.
- Browser title for deployed applications now correctly displays the application title.
- Upgraded UI5 libraries to resolve security vulnerabilities.

## [1.2.0] - 2021-05-28
### Fixed
- The Fiori generator will be automatically installed if it is invoked from the command palette in VSCode and not already installed.
- Projects migrated from WebIDE to Business Application Studio can now be deployed.
- Migrated projects now include an OPA test script where applicable.

## [1.1.11] - 2021-05-14
#### Added
- Added support to include undeployment script (check `undeploy` script in package.json) when deployment configuration is generated for ABAP systems.

#### Fixed
- To ensure consistency, all generated V2, V4 or CAP applications will now have a header bar and preview will launch the application in a browser directly without showing Fiori launchpad first

## [1.1.10] - 2021-04-29
#### Added
- Improved the destination catalog service request to ensure the list of services returned is filtered to those suitable for Fiori applications.  Note: the catalog service needs to also be updated to accommodate this change, if not, the existing list is returned.

#### Fixed
- The Fiori migration wizard on Business Application Studio no longer asks for the client field.

## [1.1.9] - 2021-04-15
#### Added
- Fiori elements applications generated with the following floor plans now have simple OPA automated tests generated with the project:
	- List Report Object Page (with either a V2 or V4 OData service)
	- Analytical List Page (with an V4 OData service)
- Added Ability to generate a Fiori freestyle application from the command line in a non-interactive mode.
- Floor plan icons in the generator have been updated.
- The deployment configuration questions have been reduced where system information can already be determined.
- The generator now requires [MTA](https://www.npmjs.com/package/mta) Node.js package (version 1.0 or higher) to be installed globally.  Please ensure you have updated by executing `npm install -g mta`.

#### Fixed
- Navigating back and forwards within the wizard should not lose previously completed steps.
- The generator will no longer suggest the first folder in a workspace to generate the application into.
- Better handling of long module names for deployment
- The generator README.MD file now correctly details the floor plan used.

## [1.1.7] - 2021-04-01
#### Added
- Uploading a metadata document for V4 OData services is now supported.
- Better error messaging when the destination in Business Application Studio is not available.

#### Fixed
- The freestyle floor plans now correctly generate for a CAP project.
- Going back from deployment to the project attributes step in the wizard now retains the data between steps.
- Adding launchpad config on the command line can now overwrite existing configuration if desired.

## [1.1.6] - 2021-03-26
#### Fixed
- Adding Cloud Foundry deployment configuration in Business Application Studio during generation no longer results in an error.

## [1.1.5] - 2021-03-18
#### Added
- Freestyle SAPUI5 floor plan now supports OData V4 services.
- The analytical list page floor plan with OData V4 service now supports navigation entities.
- Adding deployment configuration for Cloud Foundry now supports the managed application router.
- Using the `CF Application Router Generator` for generating a multi-targeted application now supports the managed application router.

#### Fixed
- Applications deployed to the managed application router cannot resolve the ui5 destination.
- In some cases, validation messages for invalid OData service URLs were not being displayed.

## [1.1.4] - 2021-03-04
#### Added
- Added support for the central Fiori Launchpad for managed app router configurations.
- Generated projects no longer contain a `.npmrc` file and use the global settings.
- Project generation time has been improved.

#### Fixed
- The Fiori generator no longer has a conflict with the SAP Mobile Development Kit VSCode extension.
- Fixed invalid 401 error for OData service URL endpoints.
- Project folder is no longer created before generation starts.
- Deployment to Cloud Foundry now supports Org name with spaces.
- Updating an existing MTA file with deployment configuration on Windows is now supported.

## [1.1.2] - 2021-02-19
#### Added
- Support for adding project deployment configuration to an existing managed app router.
- Project paths in generated launch configuration are now relative.
- Migrating an existing application now prompts for system client.
- In SAP Business Application Studio, the destination name for MTA deployment configuration is now a dropdown of available destinations rather than a free text field.
- For ABAP deployment configuration, the user can now optionally provide a deployment description.

#### Fixed
- Standalone deployment to Cloud Foundry no longer returns an error.

## [1.1.0] - 2021-02-05
#### Added
- Initial Version
- Consolidated the existing `Fiori elements` and `Fiori freestyle` generators into one. The first step of the combined generator will ask you to choose which type of application you would like to generate.
- Added support for deployment configuration as part of generation. Users can now choose to add either Cloud Foundry or ABAP deployment configuration using the generator if they wish.
- Added support for Fiori launch pad (FLP) configuration as part of generation.  
- Added a new `Cloud Foundry Application Router Generator` that allows the user to generate generic Cloud Foundry configuration which can then be used with subsequent Fiori projects.
- Added support for custom paths for folder locations in CDS projects.
- The authenticated username is now displayed alongside the saved system name when using VSCode.
