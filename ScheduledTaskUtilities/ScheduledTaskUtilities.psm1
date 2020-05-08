## Constant Enums for Schedule Tasks. Derived from taskschd.h
Add-Type -TypeDefinition @" 
public enum TASK_RUN_FLAGS
    {
        TASK_RUN_NO_FLAGS	= 0,
        TASK_RUN_AS_SELF	= 0x1,
        TASK_RUN_IGNORE_CONSTRAINTS	= 0x2,
        TASK_RUN_USE_SESSION_ID	= 0x4,
        TASK_RUN_USER_SID	= 0x8
    }
public enum TASK_ENUM_FLAGS
    {
        TASK_ENUM_HIDDEN	= 0x1
    }
public enum TASK_LOGON_TYPE
    {
        TASK_LOGON_NONE	= 0,
        TASK_LOGON_PASSWORD	= 1,
        TASK_LOGON_S4U	= 2,
        TASK_LOGON_INTERACTIVE_TOKEN	= 3,
        TASK_LOGON_GROUP	= 4,
        TASK_LOGON_SERVICE_ACCOUNT	= 5,
        TASK_LOGON_INTERACTIVE_TOKEN_OR_PASSWORD	= 6
    }
public enum TASK_RUNLEVEL
    {
        TASK_RUNLEVEL_LUA	= 0,
        TASK_RUNLEVEL_HIGHEST	= 1
    }
public enum TASK_PROCESSTOKENSID
    {
        TASK_PROCESSTOKENSID_NONE	= 0,
        TASK_PROCESSTOKENSID_UNRESTRICTED	= 1,
        TASK_PROCESSTOKENSID_DEFAULT	= 2
    }
public enum TASK_STATE
    {
        TASK_STATE_UNKNOWN	= 0,
        TASK_STATE_DISABLED	= 1,
        TASK_STATE_QUEUED	= 2,
        TASK_STATE_READY	= 3,
        TASK_STATE_RUNNING	= 4
    }
public enum TASK_CREATION
    {
        TASK_VALIDATE_ONLY	= 0x1,
        TASK_CREATE	= 0x2,
        TASK_UPDATE	= 0x4,
        TASK_CREATE_OR_UPDATE	= ( TASK_CREATE | TASK_UPDATE ) ,
        TASK_DISABLE	= 0x8,
        TASK_DONT_ADD_PRINCIPAL_ACE	= 0x10,
        TASK_IGNORE_REGISTRATION_TRIGGERS	= 0x20
    }
public enum TASK_TRIGGER_TYPE2
    {
        TASK_TRIGGER_EVENT	= 0,
        TASK_TRIGGER_TIME	= 1,
        TASK_TRIGGER_DAILY	= 2,
        TASK_TRIGGER_WEEKLY	= 3,
        TASK_TRIGGER_MONTHLY	= 4,
        TASK_TRIGGER_MONTHLYDOW	= 5,
        TASK_TRIGGER_IDLE	= 6,
        TASK_TRIGGER_REGISTRATION	= 7,
        TASK_TRIGGER_BOOT	= 8,
        TASK_TRIGGER_LOGON	= 9,
        TASK_TRIGGER_SESSION_STATE_CHANGE	= 11,
        TASK_TRIGGER_CUSTOM_TRIGGER_01	= 12
    }
public enum TASK_SESSION_STATE_CHANGE_TYPE
    {
        TASK_CONSOLE_CONNECT	= 1,
        TASK_CONSOLE_DISCONNECT	= 2,
        TASK_REMOTE_CONNECT	= 3,
        TASK_REMOTE_DISCONNECT	= 4,
        TASK_SESSION_LOCK	= 7,
        TASK_SESSION_UNLOCK	= 8
    }
public enum TASK_ACTION_TYPE
    {
        TASK_ACTION_EXEC	= 0,
        TASK_ACTION_COM_HANDLER	= 5,
        TASK_ACTION_SEND_EMAIL	= 6,
        TASK_ACTION_SHOW_MESSAGE	= 7
    }
public enum TASK_INSTANCES_POLICY
    {
        TASK_INSTANCES_PARALLEL	= 0,
        TASK_INSTANCES_QUEUE	= 1,
        TASK_INSTANCES_IGNORE_NEW	= 2,
        TASK_INSTANCES_STOP_EXISTING	= 3
    }
public enum TASK_COMPATIBILITY
    {
        TASK_COMPATIBILITY_AT	= 0,
        TASK_COMPATIBILITY_V1	= 1,
        TASK_COMPATIBILITY_V2	= 2,
        TASK_COMPATIBILITY_V2_1	= 3,
        TASK_COMPATIBILITY_V2_2	= 4,
        TASK_COMPATIBILITY_V2_3	= 5,
        TASK_COMPATIBILITY_V2_4	= 6
    }
"@
#Constants from wuapi.h
Add-Type -TypeDefinition @"
public enum OperationResultCode
    {
        orcNotStarted	= 0,
        orcInProgress	= 1,
        orcSucceeded	= 2,
        orcSucceededWithErrors	= 3,
        orcFailed	= 4,
        orcAborted	= 5
    }
"@
#Constant from wuapicommon.h
Add-Type -TypeDefinition @"
public enum ServerSelection
    {
        ssDefault	= 0,
        ssManagedServer	= 1,
        ssWindowsUpdate	= 2,
        ssOthers	= 3
    } 
"@
# Loader for external modules
$ScriptRoot = Split-Path $Script:MyInvocation.MyCommand.Path
$Public = @( Get-ChildItem -Path $ScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $ScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
@($Public + $Private) | Foreach-Object { . $_.FullName }
Export-ModuleMember -Function $Public.Basename