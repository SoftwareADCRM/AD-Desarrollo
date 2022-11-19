[CustomMessages]

sql2008r2expressx86_title=Microsoft SQL Server 2008 R2 Express Edition x86 (Including Tools)
sql2008r2expressx64_title=Microsoft SQL Server 2008 R2 Express Edition x64 (Including Tools)

sql2008r2expressx86_size=235.5 MB
sql2008r2expressx64_size=247.5 MB

[Code]

const
sql2008r2expressx86_url='http://download.microsoft.com/download/5/5/8/558522E0-2150-47E2-8F52-FF4D9C3645DF/SQLEXPRWT_x86_ENU.exe';
sql2008r2expressx64_url='http://download.microsoft.com/download/5/5/8/558522E0-2150-47E2-8F52-FF4D9C3645DF/SQLEXPRWT_x64_ENU.exe';

procedure sql2008express();

var
version: string;

begin
// Check if the full version fo the SQL Server 2008 R2 is installed
RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Microsoft SQL Server\SQLSERVER\MSSQLServer\CurrentVersion', 'CurrentVersion', version);
if (version < '10.5') or (version = '') then begin
// If the full version is not found then check for the Express edition
RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Microsoft SQL Server\SQLEXPRESS\MSSQLServer\CurrentVersion', 'CurrentVersion', version);
if (version < '10.5') (*or (version > '9.00') or (version = '') *) then begin
if isX64() then
    AddProduct('SQLEXPRWT_x64_ENU.exe', '/QS /IACCEPTSQLSERVERLICENSETERMS /ACTION=Install /FEATURES=SQL,AS,RS,IS,Tools /INSTANCENAME=SQLEXPRESS /SQLSVCACCOUNT="NT AUTHORITY\Network Service" /SQLSYSADMINACCOUNTS="builtin\Administrators" /INDICATEPROGRESS /TCPENABLED=1 /BROWSERSVCSTARTUPTYPE=Automatic /ERRORREPORTING=0 /SQMREPORTING=0 /SECURITYMODE=SQL /SAPWD=12345678', CustomMessage('sql2008r2expressx64_title'), CustomMessage('sql2008r2expressx64_size'), sql2008r2expressx64_url,false,false)
else
AddProduct('SQLEXPRWT_x86_ENU.exe', '/QS /IACCEPTSQLSERVERLICENSETERMS /ACTION=Install /FEATURES=SQL,AS,RS,IS,Tools /INSTANCENAME=SQLEXPRESS /SQLSVCACCOUNT="NT AUTHORITY\Network Service" /SQLSYSADMINACCOUNTS="builtin\Administrators" /INDICATEPROGRESS /TCPENABLED=1 /BROWSERSVCSTARTUPTYPE=Automatic /ERRORREPORTING=0 /SQMREPORTING=0 /SECURITYMODE=SQL /SAPWD=12345678', CustomMessage('sql2008r2expressx86_title'), CustomMessage('sql2008r2expressx86_size'), sql2008r2expressx86_url,false,false);
        end;
    end;
end;
