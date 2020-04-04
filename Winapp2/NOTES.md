### Convert Winapp2.ini file to Win/ANSI format: ###

You can open the Winapp2.ini file directly in the browser (raw view) and then copy and paste the whole content into a previous Winapp2.ini file (with Win/ANSI format).

Or you can use "Notepad++" to quickly convert the downloaded Winapp2.ini file (Encoding > Convert to ANSI, Edit > EOL Conversion > Convert to Windows Format).

### DetectOS: ###

Usually DetectOS works as follows: DetectOS=from|to

**For example:** DetectOS=6.0|6.3 detects Windows versions from Vista to 8.1.

If you leave the "from" side blank it includes all previous versions. If you leave the "to" side blank it includes all subsequent versions.

**For example:** DetectOS=|6.0 detects all Windows versions from XP to Vista. And DetectOS=6.0| detects all Windows versions from Vista to 10.

If you omit the pipe symbol "|" (e.g. DetectOS=6.0) it should be the same like leaving the "to" side blank (e.g. DetectOS=6.0|).

**Versions**: 5.1 = XP, 5.2 = XP x64, 6.0 = Vista, 6.1 = 7, 6.2 = 8, 6.3 = 8.1, 10.0 = 10

### DetectFile and wildcard: ###

It works very limited. A wildcard works only on the last foldername or filename of a path.

**Work:**  
DetectFile=%ProgramFiles%\\Test\*  
DetectFile=%ProgramFiles%\\Te\*t1  
DetectFile=%ProgramFiles%\\Test1\\program\*.exe

**Don't work:**  
DetectFile=%ProgramFiles%\\Test\*\\  
DetectFile=%ProgramFiles%\\Test\*\\program.exe  
DetectFile=%ProgramFiles%\\\*\\program.exe

### REMOVESELF and pattern with file extension: ###

Only if the folder is empty after the deletion of the specified files, REMOVESELF removes the folder also. If there are still other files left, the folder stays.

**For example:** FileKey1=%UserProfile%\\BrawlhallaReplays|\*.replay|REMOVESELF

If the folder "BrawlhallaReplays" is empty after the deletion of all files matching the pattern "\*.replay", then REMOVESELF removes the folder "BrawlhallaReplays" also.

It's just a more specific version of "\*.\*|REMOVESELF".

### ExcludeKey and separator: ###

If you specify different files using the separator ";", they always need to start with a wildcard. Without the wildcard, only the first pattern matches.

**For example:** ExcludeKey1=PATH|%WinDir%\\|\*setup.log;\*install.log

If a pattern starts with a wildcard, the ExcludeKey uses RECURSE (it then excludes the matching files in the specified folder and all subfolders).

**Important:** All patterns after the first separator ignore the specified path. Therefore, the matching files are excluded system-wide! Obviously, this is a bug in CCleaner. (Thanks to novaceb881 for finding this bug.)

### Wildcards: ###

CCleaner supports the DOS/CMD wildcards "\*" and "?".

The \* wildcard will match any sequence of characters (0 or more, including NULL characters).  
The ? wildcard will match a single character (or a NULL at the end of a filename).

### VirtualStore: ###

IMHO most of the VirtualStore lines aren't necessary. Only very old "legacy" applications (coded for Windows XP and older) are redirected to VirtualStore. If the application is a certified Vista (or newer) application this should never happen. Of course, there are exceptions (some "wrong" coded applications), but I never had one until now.

[Microsoft Community: VirtualStore for non-experts](https://answers.microsoft.com/en-us/windows/forum/windows_7-windows_programs/please-explain-virtualstore-for-non-experts/d8912f80-b275-48d7-9ff3-9e9878954227?auth=1)

(Windows XP itself doesn't have the VirtualStore feature at all. This was introduced with Windows Vista for better compatibility with the new UAC.)

### Environment variables: ###

**%AppData%**  
*Vista-10:* C:\\Users\\{username}\\AppData\\Roaming  
*XP:* C:\\Documents and Settings\\{username}\\Application Data

**%CommonAppData%**  
*Vista-10:* C:\\ProgramData  
*XP:* C:\\Documents and Settings\\All Users\\Application Data

**%CommonProgramFiles%**  
*XP-10:* C:\\Program Files\\Common Files  
*XP-10:* C:\\Program Files (x86)\\Common Files  
(This will work for both 32-bit and 64-bit folders as CCleaner will detect it on its own.)

**%Documents%**  
*Vista-10:* C:\\Users\\{username}\\Documents  
*XP:* C:\\Documents and Settings\\{username}\\My Documents

**%LocalAppData%**  
*Vista-10:* C:\\Users\\{username}\\AppData\\Local  
*XP:* C:\\Documents and Settings\\{username}\\Local Settings\\Application Data

**%LocalLowAppData%**  
*Vista-10:* C:\\Users\\{username}\\AppData\\LocalLow

**%Music%**  
*Vista-10:* C:\\Users\\{username}\\Music  
*XP:* C:\\Documents and Settings\\{username}\\My Documents\\My Music

**%Pictures%**  
*Vista-10:* C:\\Users\\{username}\\Pictures  
*XP:* C:\\Documents and Settings\\{username}\\My Documents\\My Pictures

**%ProgramFiles%**  
*XP-10:* C:\\Program Files  
*XP-10:* C:\\Program Files (x86)  
(This will work for both 32-bit and 64-bit folders as CCleaner will detect it on its own.)

**%Public%**  
*Vista-10:* C:\\Users\\Public

**%SystemDrive%**  
*XP-10:* C:

**%UserProfile%**  
*Vista-10:* C:\\Users\\{username}  
*XP:* C:\\Documents and Settings\\{username}

**%Video%**  
*Vista-10:* C:\\Users\\{username}\\Videos  
*XP:* C:\\Documents and Settings\\{username}\\My Documents\\My Videos

**%WinDir%**  
*XP-10:* C:\\Windows

### Official documentation: ###

[CCleaner documentation: Add entries](https://www.ccleaner.com/docs/ccleaner/advanced-usage/ccleaner-ini-files/how-to-add-your-own-program-for-ccleaner-to-clean)  
[CCleaner documentation: ExcludeKey](https://www.ccleaner.com/docs/ccleaner/advanced-usage/ccleaner-ini-files/how-to-exclude-items-from-ccleaners-cleaning)

### These are not the usual log files: ###

[Extensible Storage Engine](https://docs.microsoft.com/en-us/windows/win32/extensible-storage-engine/extensible-storage-engine-files#reserved-transaction-log-files)  
[LevelDB](https://github.com/google/leveldb/blob/master/doc/impl.md)

### GitHub comments: ###

GitHub uses "Styling with Markdown". Therefore, you have to escape some special characters with a backslash "\\". The special characters are for example the asterisk "\*" and the backslash "\\" itself (escaping: "\\\*" or "\\\\").
