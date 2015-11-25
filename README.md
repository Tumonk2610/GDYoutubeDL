# GDYoutubeDL
Objective-C Wrapper for <code>youtube-dl</code>

In summary, this just uses NSTask to execute the command, and allows developers to add arguments easily.

# Features

Checking to see if <code>youtube-dl</code> is currently installed.

```objective-c
[GDYoutubeDL isYoutubeDLInstalled]; // Returns YES or NO
```

Create a new object with just the URL. (File location default to ~/Downloads)

```objective-c
GDYoutubeDL* downloader = [[GDYoutubeDL alloc] initWithURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=dQw4w9WgXcQ"]];
```

Create a new object with the URL and file path.

```objective-c
GDYoutubeDL* downloader = [[GDYoutubeDL alloc] initWithURL:[NSURL URLWithString:@""] atFilePath:[NSURL URLWithString:@""];
```

Change the file name (excluding file type). The default is "titleofvideo"."extension"

```objective-c
[downloader addFileName:@"Rick Rolled"];
```

Remove weird characters from the file name (usually used with default file name)

```objective-c
[downloader addStrictFileName];
```

Get the current variables that will be used is the download process

```objective-c
NSArray *args = [downloader arguments];
```

Start the download (WIP, no progress or complete indication)

```objective-c
[downloader beginDownload];
```
