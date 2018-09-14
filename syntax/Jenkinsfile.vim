"
"syntax/Jenkinsfile.vim

" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" runtime! syntax/groovy.vim
syn include @Groovy syntax/groovy.vim

" Define Jenkins File Keywords
let s:jenkins_keywords = [
      \ 'environment', 'options', 'parameters', 'triggers', 'stage', 'tools', 'input', 'when',
      \ 'perfReport', 'bzt', 'params', 'env', 'currentBuild', 'scm',
      \ 'agent', 'stages', 'post', 'steps',
      \ 'image', 'args', 'dockerfile', 'additionalBuildArgs',
      \ 'checkout', 'docker', 'node', 'scm', 'sh', 'parallel', 'step', 'tool', 'always',
      \ 'changed', 'failure', 'success', 'unstable', 'aborted',
      \ 'Applitools', 'ArtifactoryGradleBuild', 'Consul', 'MavenDescriptorStep', 'OneSky', 'VersionNumber',
      \ 'ViolationsToBitbucketServer', 'ViolationsToGitHub', 'ViolationsToGitLab', '_OcAction', '_OcContextInit',
      \ '_OcWatch', 'acceptGitLabMR', 'acsDeploy', 'activateDTConfiguration', 'addBadge', 'addErrorBadge',
      \ 'addGitLabMRComment', 'addInfoBadge', 'addInteractivePromotion', 'addShortText', 'addWarningBadge',
      \ 'allure', 'anchore', 'androidApkMove', 'androidApkUpload', 'androidLint', 'ansiColor', 'ansiblePlaybook',
      \ 'ansibleTower', 'ansibleVault', 'appMonBuildEnvironment', 'appMonPublishTestResults', 'appMonRegisterTestRun',
      \ 'applatix', 'approveReceivedEvent', 'approveRequestedEvent', 'aqua', 'archive', 'archiveArtifacts',
      \ 'arestocats', 'artifactResolver', 'artifactoryDistributeBuild', 'artifactoryDownload', 'artifactoryMavenBuild',
      \ 'artifactoryPromoteBuild', 'artifactoryUpload', 'awaitDeployment', 'awaitDeploymentCompletion',
      \ 'awsCodeBuild', 'awsIdentity', 'azureCLI', 'azureDownload', 'azureFunctionAppPublish', 'azureUpload',
      \ 'azureVMSSUpdate', 'azureVMSSUpdateInstances', 'azureWebAppPublish', 'backlogPullRequest', 'bat',
      \ 'bearychatSend', 'benchmark', 'bitbucketStatusNotify', 'blazeMeterTest', 'build', 'buildBamboo', 'buildImage',
      \ 'bzt', 'cache', 'catchError', 'cbt', 'cbtScreenshotsTest', 'cbtSeleniumTest', 'cfInvalidate', 'cfnCreateChangeSet',
      \ 'cfnDelete', 'cfnDeleteStackSet', 'cfnDescribe', 'cfnExecuteChangeSet', 'cfnExports', 'cfnUpdate',
      \ 'cfnUpdateStackSet', 'cfnValidate', 'changeAsmVer', 'checkstyle', 'chefSinatraStep', 'cifsPublisher',
      \ 'cleanWs', 'cleanup', 'cloudshareDockerMachine', 'cm', 'cmake', 'cmakeBuild', 'cobertura', 'codefreshLaunch',
      \ 'codefreshRun', 'codescene', 'codesonar', 'collectEnv', 'conanAddRemote', 'conanAddUser', 'configFileProvider',
      \ 'container', 'containerLog', 'contrastAgent', 'contrastVerification', 'copy', 'copyArtifacts', 'coverityResults',
      \ 'cpack', 'createDeploymentEvent', 'createEnvironment', 'createEvent', 'createMemoryDump', 'createSummary',
      \ 'createThreadDump', 'crxBuild', 'crxDeploy', 'crxDownload', 'crxReplicate', 'crxValidate', 'ctest', 'ctmInitiatePipeline',
      \ 'ctmPostPiData', 'ctmSetPiData', 'cucumber', 'cucumberSlackSend', 'currentNamespace', 'debianPbuilder',
      \ 'deleteDir', 'dependencyCheckAnalyzer', 'dependencyCheckPublisher', 'dependencyCheckUpdateOnly',
      \ 'dependencyTrackPublisher', 'deployAPI', 'deployArtifacts', 'deployLambda', 'dingding', 'dir', 'disk',
      \ 'dockerFingerprintFrom', 'dockerFingerprintRun', 'dockerNode', 'dockerPullStep', 'dockerPushStep',
      \ 'dockerPushWithProxyStep', 'doktor', 'downloadProgetPackage', 'downstreamPublisher', 'dropbox',
      \ 'dry', 'ec2', 'ec2ShareAmi', 'echo', 'ecrLogin', 'emailext', 'emailextrecipients', 'envVarsForTool', 'error',
      \ 'evaluateGate', 'eventSourceLambda', 'executeCerberusCampaign', 'exportPackages', 'exportProjects',
      \ 'exws', 'exwsAllocate', 'figlet', 'fileExists', 'fileOperations', 'findFiles', 'findbugs', 'fingerprint',
      \ 'flywayrunner', 'ftp', 'ftpPublisher', 'gatlingArchive', 'getArtifactoryServer', 'getContext', 'getLastChangesPublisher',
      \ 'git', 'gitbisect', 'githubNotify', 'gitlabBuilds', 'gitlabCommitStatus', 'googleCloudBuild', 'googleStorageDownload',
      \ 'googleStorageUpload', 'gprbuild', 'greet', 'hipchatSend', 'http', 'httpRequest', 'hub_detect', 'hub_scan',
      \ 'hub_scan_failure', 'hubotApprove', 'hubotSend', 'importPackages', 'importProjects', 'inNamespace',
      \ 'inSession', 'initConanClient', 'input', 'invokeLambda', 'isUnix', 'ispwOperation', 'ispwRegisterWebhook',
      \ 'ispwWaitForWebhook', 'jacoco', 'jdbc', 'jiraAddComment', 'jiraAddWatcher', 'jiraAssignIssue', 'jiraAssignableUserSearch',
      \ 'jiraComment', 'jiraDeleteAttachment', 'jiraDeleteIssueLink', 'jiraDeleteIssueRemoteLink', 'jiraDeleteIssueRemoteLinks',
      \ 'jiraDownloadAttachment', 'jiraEditComment', 'jiraEditComponent', 'jiraEditIssue', 'jiraEditVersion',
      \ 'jiraGetAttachmentInfo', 'jiraGetComment', 'jiraGetComments', 'jiraGetComponent', 'jiraGetComponentIssueCount',
      \ 'jiraGetFields', 'jiraGetIssue', 'jiraGetIssueLink', 'jiraGetIssueLinkTypes', 'jiraGetIssueRemoteLink',
      \ 'jiraGetIssueRemoteLinks', 'jiraGetIssueTransitions', 'jiraGetIssueWatches', 'jiraGetProject',
      \ 'jiraGetProjectComponents', 'jiraGetProjectStatuses', 'jiraGetProjectVersions', 'jiraGetProjects',
      \ 'jiraGetVersion', 'jiraIssueSelector', 'jiraJqlSearch', 'jiraLinkIssues', 'jiraNewComponent', 'jiraNewIssue',
      \ 'jiraNewIssueRemoteLink', 'jiraNewIssues', 'jiraNewVersion', 'jiraNotifyIssue', 'jiraSearch', 'jiraTransitionIssue',
      \ 'jiraUploadAttachment', 'jiraUserSearch', 'jmhReport', 'jobDsl', 'junit', 'klocworkBuildSpecGeneration',
      \ 'klocworkIncremental', 'klocworkIntegrationStep1', 'klocworkIntegrationStep2', 'klocworkIssueSync',
      \ 'klocworkQualityGateway', 'klocworkWrapper', 'kubernetesApply', 'kubernetesDeploy', 'lastChanges',
      \ 'libraryResource', 'liquibaseDbDoc', 'liquibaseRollback', 'liquibaseUpdate', 'listAWSAccounts',
      \ 'livingDocs', 'loadRunnerTest', 'lock', 'logstashSend', 'mail', 'marathon', 'mattermostSend', 'memoryMap',
      \ 'milestone', 'mockLoad', 'newArtifactoryServer', 'newBuildInfo', 'newGradleBuild', 'newMavenBuild',
      \ 'nexusArtifactUploader', 'nexusPolicyEvaluation', 'nexusPublisher', 'node', 'nodejs', 'nodesByLabel',
      \ 'notifyBitbucket', 'notifyDeploymon', 'notifyOTC', 'nunit', 'nvm', 'octoPerfTest', 'office365ConnectorSend',
      \ 'openTasks', 'openshiftBuild', 'openshiftCreateResource', 'openshiftDeleteResourceByJsonYaml',
      \ 'openshiftDeleteResourceByKey', 'openshiftDeleteResourceByLabels', 'openshiftDeploy', 'openshiftExec',
      \ 'openshiftImageStream', 'openshiftScale', 'openshiftTag', 'openshiftVerifyBuild', 'openshiftVerifyDeployment',
      \ 'openshiftVerifyService', 'openstackMachine', 'osfBuilderSuiteForSFCCDeploy', 'p4', 'p4approve',
      \ 'p4publish', 'p4sync', 'p4tag', 'p4unshelve', 'pagerduty', 'parasoftFindings', 'pcBuild', 'pdrone', 'perfReport',
      \ 'perfSigReports', 'perfpublisher', 'plot', 'pmd', 'podTemplate', 'powershell', 'pragprog', 'pretestedIntegrationPublisher',
      \ 'properties', 'protecodesc', 'publishATX', 'publishBrakeman', 'publishBuildInfo', 'publishBuildRecord',
      \ 'publishConfluence', 'publishDeployRecord', 'publishETLogs', 'publishEventQ', 'publishGenerators',
      \ 'publishHTML', 'publishLambda', 'publishLastChanges', 'publishSQResults', 'publishStoplight', 'publishTMS',
      \ 'publishTRF', 'publishTestResult', 'publishTraceAnalysis', 'publishUNIT', 'publishValgrind', 'pullPerfSigReports',
      \ 'puppetCode', 'puppetHiera', 'puppetJob', 'puppetQuery', 'pushImage', 'pushToCloudFoundry', 'pwd', 'pybat',
      \ 'pysh', 'qc', 'queryModuleBuildRequest', 'questavrm', 'r', 'radargunreporting', 'rancher', 'readFile', 'readJSON',
      \ 'readManifest', 'readMavenPom', 'readProperties', 'readTrusted', 'readXml', 'readYaml', 'realtimeJUnit',
      \ 'registerWebhook', 'release', 'resolveScm', 'retry', 'rocketSend', 'rtp', 'runConanCommand', 'runFromAlmBuilder',
      \ 'runLoadRunnerScript', 'runValgrind', 's3CopyArtifact', 's3Delete', 's3Download', 's3FindFiles', 's3Upload',
      \ 'salt', 'sauce', 'saucePublisher', 'sauceconnect', 'script', 'selectRun', 'sendCIMessage', 'sendDeployableMessage',
      \ 'serviceNow_attachFile', 'serviceNow_attachZip', 'serviceNow_createChange', 'serviceNow_getCTask',
      \ 'serviceNow_getChangeState', 'serviceNow_updateChangeItem', 'setAccountAlias', 'setGerritReview',
      \ 'setGitHubPullRequestStatus', 'sha1', 'signAndroidApks', 'silkcentral', 'silkcentralCollectResults',
      \ 'slackSend', 'sleep', 'sloccountPublish', 'snsPublish', 'snykSecurity', 'sonarToGerrit', 'sparkSend',
      \ 'splitTests', 'springBoot', 'sscm', 'sseBuild', 'sseBuildAndPublish', 'sshPublisher', 'sshagent',
      \ 'startET', 'startSandbox', 'startSession', 'startTS', 'stash', 'stepcounter', 'stopET', 'stopSandbox',
      \ 'stopSession', 'stopTS', 'submitJUnitTestResultsToqTest', 'submitModuleBuildRequest', 'svChangeModeStep',
      \ 'svDeployStep', 'svExportStep', 'svUndeployStep', 'svn', 'tagImage', 'task', 'teamconcert', 'tee', 'testFolder',
      \ 'testPackage', 'testProject', 'testiniumExecution', 'themisRefresh', 'themisReport', 'throttle', 'time',
      \ 'timeout', 'timestamps', 'tm', 'touch', 'triggerInputStep', 'triggerJob', 'typetalkSend', 'uftScenarioLoad',
      \ 'unarchive', 'unstash', 'unzip', 'updateBotPush', 'updateGitlabCommitStatus', 'updateIdP', 'updateTrustPolicy',
      \ 'upload-pgyer', 'uploadProgetPackage', 'uploadToIncappticConnect', 'vSphere', 'validateDeclarativePipeline',
      \ 'vmanagerLaunch', 'waitForCIMessage', 'waitForJob', 'waitForQualityGate', 'waitForWebhook', 'waitUntil',
      \ 'walk', 'waptProReport', 'warnings', 'whitesource', 'winRMClient', 'withAWS', 'withAnt', 'withContext', 'withCoverityEnv',
      \ 'withCredentials', 'withDockerContainer', 'withDockerRegistry', 'withDockerServer', 'withEnv', 'withKafkaLog',
      \ 'withKubeConfig', 'withMaven', 'withNPM', 'withPod', 'withPythonEnv', 'withSCM', 'withSandbox', 'withSonarQubeEnv',
      \ 'withTypetalk', 'wrap', 'writeFile', 'writeJSON', 'writeMavenPom', 'writeProperties', 'writeXml', 'writeYaml',
      \ 'ws', 'xUnitImporter', 'xUnitUploader', 'xldCreatePackage', 'xldDeploy', 'xldPublishPackage', 'xlrCreateRelease',
      \ 'xrayScanBuild', 'zip', 'expression', 'label'
      \ ]

" Top level
syn keyword jenkinsfileTop pipeline contained
syn keyword jenkinsfileTop library contained

let s:levels = [
      \ 'Identifier',
      \ 'Include',
      \ 'Constant',
      \ 'Statement',
      \ 'Keyword',
      \ 'Function',
      \ ]

let s:max = len(s:levels)

for lvl in range(1, s:max)
  for keyword in s:jenkins_keywords
    let cmd = 'syn keyword %s contained %s'
    exe printf(cmd, 'jenkinsKeyword_lvl'.lvl, keyword)
  endfor
endfor

"define base region
syn region lvl0 start=/\%^/ end=/\%$/ contains=@Groovy,lvl1,jenkinsfileTop

" define regions
for lvl in range(1, s:max)
  let nextLvl = (lvl % s:max) + 1
  let contained = lvl == 1 ? '' : 'contained'
  let cmd = 'syn region %s matchgroup=%s start=/{/ end=/}/ contains=@Groovy,%s,%s %s'
  exe printf(cmd, 'lvl'.lvl, 'lvl'.lvl, 'lvl'.nextLvl, 'jenkinsKeyword_lvl'.lvl, contained)
endfor

" define highlighting
for lvl in range(1, s:max)
  let cmd = 'hi link %s %s'
  exe printf(cmd, 'jenkinsKeyword_lvl'.lvl, s:levels[lvl-1])
endfor

hi link jenkinsfileTop Structure

let b:current_syntax = "Jenkinsfile"
