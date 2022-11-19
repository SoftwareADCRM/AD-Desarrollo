// requires Windows 7, Windows 7 Service Pack 1, Windows Server 2003 Service Pack 2, Windows Server 2008, Windows Server 2008 R2, Windows Server 2008 R2 SP1, Windows Vista Service Pack 1, Windows XP Service Pack 3
// requires Windows Installer 3.1
// requires Internet Explorer 5.01
// WARNING: express setup (downloads and installs the components depending on your OS) if you want to deploy it on cd or network download the full bootsrapper on website below
// http://www.microsoft.com/downloads/en/details.aspx?FamilyID=5765d7a8-7722-4888-a970-ac39b33fd8ab

[CustomMessages]
dotnetfx40client_title=.NET Framework 4.0 Client

dotnetfx40client_size=3 MB - 197 MB

;http://www.microsoft.com/globaldev/reference/lcid-all.mspx
en.dotnetfx40client_lcid=''
;de.dotnetfx40client_lcid='/lcid 1031 '

[Code]
const
	dotnetfx40client_url = 'http://download.microsoft.com/download/5/6/2/562A10F9-C9F4-4313-A044-9C94E0A8FAC8/dotNetFx40_Client_x86_x64.exe';

procedure dotnetfx40client();
begin
	if (not netfxinstalled(NetFx40Client, '')) then
		AddProduct('dotNetFx40_Client_setup.exe',
			CustomMessage('dotnetfx40client_lcid') + '/passive /norestart',
			CustomMessage('dotnetfx40client_title'),
			CustomMessage('dotnetfx40client_size'),
			dotnetfx40client_url,
			false, false);
end;