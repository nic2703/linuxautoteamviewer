# linuxautoteamviewer
Script to fix TeamViewer from crashing on Linux. Works by running in the background, terminating TeamViewer once the connection is dropped, and restarting it.

## Setup
This should theoretically work on basically any Linux distribution that supports TeamViewer 15.27+. 

Download 'autoteamviewer2.sh' into a reasonable directory. Navigate to that directory and make it an executable in the terminal using: 
```
chmod +x autoteamviewer2.sh
```

Then simply run the file using:
```
./autoteamviewer2.sh
```

This now runs in the selected terminal window. Once you open TeamViewer and connect to your Linux machine, everything should run normally. Once, you drop the connection, the script will take a second to close and reopen TeamViewer, and you should be set!

Please do not close this terminal session for the duration of use, as this will stop the script.

## Notes
You may have to check the location of your teamviewer folder and update the file paths inside the 'autoteamviewer2.sh' file. You can also change the logging speed, currently it checks connection status every second.

## Motivation
I use TeamViewer to access my Linux PC using my laptop. I have encountered the issue that TeamViewer crashes after 4-5 connections. Since I am away from the PC, it is not possible to restart TeamViewer. 

I have checked several forums and the issue appears to be known, but not yet fixed. I get this error in the log file: 

```
2023/11/20 22:52:53.184 16666 16692 S!! MDv2::ProviderRegistrationController::UpdateRegistrationDeferred(const boost::posix_time::time_duration&, bool)::<lambda(const boost::system::error_code&)>: retry timer failed with error: system:125
2023/11/20 22:52:53.184 16666 16680 S   InterProcessNetwork::Shutdown: Send queue for session 0 contained 65 command(s)
2023/11/20 22:52:53.184 16666 16692 S   AcceptServer::HandleAccept: socket closed
2023/11/20 22:52:53.184 16666 16680 S   InterProcessNetwork::Shutdown: Send queue for session 450215437 contained 1 command(s)
2023/11/20 22:52:53.184 16666 16680 S   RemoteSessionManager::ClearAllRemoteSessions(): RemoteSession Count: 0
2023/11/20 22:52:53.184 16666 16666 S   NetworkControl shutdown done
2023/11/20 22:52:53.194 16666 16666 S!! DBus: unable to unregister Object Path: /com/teamviewer/TeamViewer/IpcAuthority - [DBusError: Unknown DBus Error (Possibly the connection or called method is not valid anymore.) ], Errorcode=11
2023/11/20 22:52:53.194 16666 24484 S   Shutdown complete
2023/11/20 22:52:53.194 16666 16666 S   TeamViewer_Service Stop
```

I hope this is fixed soon.