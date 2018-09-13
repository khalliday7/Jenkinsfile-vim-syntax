" syntax/Jenkinsfile.vim

" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/groovy.vim

" matchgroup
syn match bracket1 /{\|}/
syn match bracket2 /{\|}/
syn match bracket3 /{\|}/
syn match bracket4 /{\|}/
syn match bracket5 /{\|}/
syn match bracket6 /{\|}/
syn match bracket7 /{\|}/
hi bracket1 guifg=#00ff00
hi bracket2 guifg=#ff0000
hi bracket3 guifg=#0000ff
hi bracket4 guifg=#00ffff
hi bracket5 guifg=#ffff00
hi bracket6 guifg=#ff00ff
hi bracket7 guifg=NONE

" for leading space
syn match lsp1 /^\s\+/
syn match lsp2 /^\s\+/
syn match lsp3 /^\s\+/
syn match lsp4 /^\s\+/
syn match lsp5 /^\s\+/
syn match lsp6 /^\s\+/
syn match lsp7 /^\s\+/
hi lsp1 guibg=#00ff00
hi lsp2 guibg=#ff0000
hi lsp3 guibg=#0000ff
hi lsp4 guibg=#00ffff
hi lsp5 guibg=#ffff00
hi lsp6 guibg=#ff00ff
hi lsp7 guibg=NONE

" define regioins
syn region level1           matchgroup=bracket1 start="{" matchgroup=bracket1 end="}" transparent contains=@jenkinsfileKeyword,level2,lsp1
syn region level2 contained matchgroup=bracket2 start="{" matchgroup=bracket2 end="}" transparent contains=@jenkinsfileKeyword,level3,lsp2
syn region level3 contained matchgroup=bracket3 start="{" matchgroup=bracket3 end="}" transparent contains=@jenkinsfileKeyword,level4,lsp3
syn region level4 contained matchgroup=bracket4 start="{" matchgroup=bracket4 end="}" transparent contains=@jenkinsfileKeyword,level5,lsp4
syn region level5 contained matchgroup=bracket5 start="{" matchgroup=bracket5 end="}" transparent contains=@jenkinsfileKeyword,level6,lsp5
syn region level6 contained matchgroup=bracket6 start="{" matchgroup=bracket6 end="}" transparent contains=@jenkinsfileKeyword,level1,lsp6

" define level highlighting
" hi link level1 Structure
" hi link level2 Identifier
" hi link level3 Statement
" hi link level4 Include
" hi link level5 Keyword
" hi link level6 Exception


" Define Jenkins File Keywords
" Pipeline
syn keyword jenkinsfileKeyword contained pipeline
" Directives
syn keyword jenkinsfileKeyword contained environment options parameters triggers stage tools input when
" Global Variables
syn keyword jenkinsfileKeyword contained perfReport bzt params env currentBuild scm
" Sections
syn keyword jenkinsfileKeyword contained agent stages post steps
syn keyword jenkinsfileKeyword contained image args dockerfile additionalBuildArgs
" Core Steps within file sections
syn keyword jenkinsfileKeyword contained checkout docker node scm sh parallel step tool always
syn keyword jenkinsfileKeyword contained changed failure success unstable aborted
" Pipeline Steps
syn keyword jenkinsfileKeyword contained Applitools ArtifactoryGradleBuild Consul MavenDescriptorStep OneSky VersionNumber
syn keyword jenkinsfileKeyword contained ViolationsToBitbucketServer ViolationsToGitHub ViolationsToGitLab _OcAction _OcContextInit
syn keyword jenkinsfileKeyword contained _OcWatch acceptGitLabMR acsDeploy activateDTConfiguration addBadge addErrorBadge
syn keyword jenkinsfileKeyword contained addGitLabMRComment addInfoBadge addInteractivePromotion addShortText addWarningBadge
syn keyword jenkinsfileKeyword contained allure anchore androidApkMove androidApkUpload androidLint ansiColor ansiblePlaybook
syn keyword jenkinsfileKeyword contained ansibleTower ansibleVault appMonBuildEnvironment appMonPublishTestResults appMonRegisterTestRun
syn keyword jenkinsfileKeyword contained applatix approveReceivedEvent approveRequestedEvent aqua archive archiveArtifacts
syn keyword jenkinsfileKeyword contained arestocats artifactResolver artifactoryDistributeBuild artifactoryDownload artifactoryMavenBuild
syn keyword jenkinsfileKeyword contained artifactoryPromoteBuild artifactoryUpload awaitDeployment awaitDeploymentCompletion
syn keyword jenkinsfileKeyword contained awsCodeBuild awsIdentity azureCLI azureDownload azureFunctionAppPublish azureUpload
syn keyword jenkinsfileKeyword contained azureVMSSUpdate azureVMSSUpdateInstances azureWebAppPublish backlogPullRequest bat
syn keyword jenkinsfileKeyword contained bearychatSend benchmark bitbucketStatusNotify blazeMeterTest build buildBamboo buildImage
syn keyword jenkinsfileKeyword contained bzt cache catchError cbt cbtScreenshotsTest cbtSeleniumTest cfInvalidate cfnCreateChangeSet
syn keyword jenkinsfileKeyword contained cfnDelete cfnDeleteStackSet cfnDescribe cfnExecuteChangeSet cfnExports cfnUpdate
syn keyword jenkinsfileKeyword contained cfnUpdateStackSet cfnValidate changeAsmVer checkstyle chefSinatraStep cifsPublisher
syn keyword jenkinsfileKeyword contained cleanWs cleanup cloudshareDockerMachine cm cmake cmakeBuild cobertura codefreshLaunch
syn keyword jenkinsfileKeyword contained codefreshRun codescene codesonar collectEnv conanAddRemote conanAddUser configFileProvider
syn keyword jenkinsfileKeyword contained container containerLog contrastAgent contrastVerification copy copyArtifacts coverityResults
syn keyword jenkinsfileKeyword contained cpack createDeploymentEvent createEnvironment createEvent createMemoryDump createSummary
syn keyword jenkinsfileKeyword contained createThreadDump crxBuild crxDeploy crxDownload crxReplicate crxValidate ctest ctmInitiatePipeline
syn keyword jenkinsfileKeyword contained ctmPostPiData ctmSetPiData cucumber cucumberSlackSend currentNamespace debianPbuilder
syn keyword jenkinsfileKeyword contained deleteDir dependencyCheckAnalyzer dependencyCheckPublisher dependencyCheckUpdateOnly
syn keyword jenkinsfileKeyword contained dependencyTrackPublisher deployAPI deployArtifacts deployLambda dingding dir disk
syn keyword jenkinsfileKeyword contained dockerFingerprintFrom dockerFingerprintRun dockerNode dockerPullStep dockerPushStep
syn keyword jenkinsfileKeyword contained dockerPushWithProxyStep doktor downloadProgetPackage downstreamPublisher dropbox
syn keyword jenkinsfileKeyword contained dry ec2 ec2ShareAmi echo ecrLogin emailext emailextrecipients envVarsForTool error
syn keyword jenkinsfileKeyword contained evaluateGate eventSourceLambda executeCerberusCampaign exportPackages exportProjects
syn keyword jenkinsfileKeyword contained exws exwsAllocate figlet fileExists fileOperations findFiles findbugs fingerprint
syn keyword jenkinsfileKeyword contained flywayrunner ftp ftpPublisher gatlingArchive getArtifactoryServer getContext getLastChangesPublisher
syn keyword jenkinsfileKeyword contained git gitbisect githubNotify gitlabBuilds gitlabCommitStatus googleCloudBuild googleStorageDownload
syn keyword jenkinsfileKeyword contained googleStorageUpload gprbuild greet hipchatSend http httpRequest hub_detect hub_scan
syn keyword jenkinsfileKeyword contained hub_scan_failure hubotApprove hubotSend importPackages importProjects inNamespace
syn keyword jenkinsfileKeyword contained inSession initConanClient input invokeLambda isUnix ispwOperation ispwRegisterWebhook
syn keyword jenkinsfileKeyword contained ispwWaitForWebhook jacoco jdbc jiraAddComment jiraAddWatcher jiraAssignIssue jiraAssignableUserSearch
syn keyword jenkinsfileKeyword contained jiraComment jiraDeleteAttachment jiraDeleteIssueLink jiraDeleteIssueRemoteLink jiraDeleteIssueRemoteLinks
syn keyword jenkinsfileKeyword contained jiraDownloadAttachment jiraEditComment jiraEditComponent jiraEditIssue jiraEditVersion
syn keyword jenkinsfileKeyword contained jiraGetAttachmentInfo jiraGetComment jiraGetComments jiraGetComponent jiraGetComponentIssueCount
syn keyword jenkinsfileKeyword contained jiraGetFields jiraGetIssue jiraGetIssueLink jiraGetIssueLinkTypes jiraGetIssueRemoteLink
syn keyword jenkinsfileKeyword contained jiraGetIssueRemoteLinks jiraGetIssueTransitions jiraGetIssueWatches jiraGetProject
syn keyword jenkinsfileKeyword contained jiraGetProjectComponents jiraGetProjectStatuses jiraGetProjectVersions jiraGetProjects
syn keyword jenkinsfileKeyword contained jiraGetVersion jiraIssueSelector jiraJqlSearch jiraLinkIssues jiraNewComponent jiraNewIssue
syn keyword jenkinsfileKeyword contained jiraNewIssueRemoteLink jiraNewIssues jiraNewVersion jiraNotifyIssue jiraSearch jiraTransitionIssue
syn keyword jenkinsfileKeyword contained jiraUploadAttachment jiraUserSearch jmhReport jobDsl junit klocworkBuildSpecGeneration
syn keyword jenkinsfileKeyword contained klocworkIncremental klocworkIntegrationStep1 klocworkIntegrationStep2 klocworkIssueSync
syn keyword jenkinsfileKeyword contained klocworkQualityGateway klocworkWrapper kubernetesApply kubernetesDeploy lastChanges
syn keyword jenkinsfileKeyword contained library libraryResource liquibaseDbDoc liquibaseRollback liquibaseUpdate listAWSAccounts
syn keyword jenkinsfileKeyword contained livingDocs loadRunnerTest lock logstashSend mail marathon mattermostSend memoryMap
syn keyword jenkinsfileKeyword contained milestone mockLoad newArtifactoryServer newBuildInfo newGradleBuild newMavenBuild
syn keyword jenkinsfileKeyword contained nexusArtifactUploader nexusPolicyEvaluation nexusPublisher node nodejs nodesByLabel
syn keyword jenkinsfileKeyword contained notifyBitbucket notifyDeploymon notifyOTC nunit nvm octoPerfTest office365ConnectorSend
syn keyword jenkinsfileKeyword contained openTasks openshiftBuild openshiftCreateResource openshiftDeleteResourceByJsonYaml
syn keyword jenkinsfileKeyword contained openshiftDeleteResourceByKey openshiftDeleteResourceByLabels openshiftDeploy openshiftExec
syn keyword jenkinsfileKeyword contained openshiftImageStream openshiftScale openshiftTag openshiftVerifyBuild openshiftVerifyDeployment
syn keyword jenkinsfileKeyword contained openshiftVerifyService openstackMachine osfBuilderSuiteForSFCCDeploy p4 p4approve
syn keyword jenkinsfileKeyword contained p4publish p4sync p4tag p4unshelve pagerduty parasoftFindings pcBuild pdrone perfReport
syn keyword jenkinsfileKeyword contained perfSigReports perfpublisher plot pmd podTemplate powershell pragprog pretestedIntegrationPublisher
syn keyword jenkinsfileKeyword contained properties protecodesc publishATX publishBrakeman publishBuildInfo publishBuildRecord
syn keyword jenkinsfileKeyword contained publishConfluence publishDeployRecord publishETLogs publishEventQ publishGenerators
syn keyword jenkinsfileKeyword contained publishHTML publishLambda publishLastChanges publishSQResults publishStoplight publishTMS
syn keyword jenkinsfileKeyword contained publishTRF publishTestResult publishTraceAnalysis publishUNIT publishValgrind pullPerfSigReports
syn keyword jenkinsfileKeyword contained puppetCode puppetHiera puppetJob puppetQuery pushImage pushToCloudFoundry pwd pybat
syn keyword jenkinsfileKeyword contained pysh qc queryModuleBuildRequest questavrm r radargunreporting rancher readFile readJSON
syn keyword jenkinsfileKeyword contained readManifest readMavenPom readProperties readTrusted readXml readYaml realtimeJUnit
syn keyword jenkinsfileKeyword contained registerWebhook release resolveScm retry rocketSend rtp runConanCommand runFromAlmBuilder
syn keyword jenkinsfileKeyword contained runLoadRunnerScript runValgrind s3CopyArtifact s3Delete s3Download s3FindFiles s3Upload
syn keyword jenkinsfileKeyword contained salt sauce saucePublisher sauceconnect script selectRun sendCIMessage sendDeployableMessage
syn keyword jenkinsfileKeyword contained serviceNow_attachFile serviceNow_attachZip serviceNow_createChange serviceNow_getCTask
syn keyword jenkinsfileKeyword contained serviceNow_getChangeState serviceNow_updateChangeItem setAccountAlias setGerritReview
syn keyword jenkinsfileKeyword contained setGitHubPullRequestStatus sha1 signAndroidApks silkcentral silkcentralCollectResults
syn keyword jenkinsfileKeyword contained slackSend sleep sloccountPublish snsPublish snykSecurity sonarToGerrit sparkSend
syn keyword jenkinsfileKeyword contained splitTests springBoot sscm sseBuild sseBuildAndPublish sshPublisher sshagent
syn keyword jenkinsfileKeyword contained startET startSandbox startSession startTS stash stepcounter stopET stopSandbox
syn keyword jenkinsfileKeyword contained stopSession stopTS submitJUnitTestResultsToqTest submitModuleBuildRequest svChangeModeStep
syn keyword jenkinsfileKeyword contained svDeployStep svExportStep svUndeployStep svn tagImage task teamconcert tee testFolder
syn keyword jenkinsfileKeyword contained testPackage testProject testiniumExecution themisRefresh themisReport throttle time
syn keyword jenkinsfileKeyword contained timeout timestamps tm touch triggerInputStep triggerJob typetalkSend uftScenarioLoad
syn keyword jenkinsfileKeyword contained unarchive unstash unzip updateBotPush updateGitlabCommitStatus updateIdP updateTrustPolicy
syn keyword jenkinsfileKeyword contained upload-pgyer uploadProgetPackage uploadToIncappticConnect vSphere validateDeclarativePipeline
syn keyword jenkinsfileKeyword contained vmanagerLaunch waitForCIMessage waitForJob waitForQualityGate waitForWebhook waitUntil
syn keyword jenkinsfileKeyword contained walk waptProReport warnings whitesource winRMClient withAWS withAnt withContext withCoverityEnv
syn keyword jenkinsfileKeyword contained withCredentials withDockerContainer withDockerRegistry withDockerServer withEnv withKafkaLog
syn keyword jenkinsfileKeyword contained withKubeConfig withMaven withNPM withPod withPythonEnv withSCM withSandbox withSonarQubeEnv
syn keyword jenkinsfileKeyword contained withTypetalk wrap writeFile writeJSON writeMavenPom writeProperties writeXml writeYaml
syn keyword jenkinsfileKeyword contained ws xUnitImporter xUnitUploader xldCreatePackage xldDeploy xldPublishPackage xlrCreateRelease
syn keyword jenkinsfileKeyword contained xrayScanBuild zip

let b:current_syntax = "Jenkinsfile"
