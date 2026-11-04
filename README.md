# Hourglass Menu Bar Icon For Mac

## How to run the app?

There are two ways to run it:

### Option 1: Directly with `Swift` (no separate build step)

```
swift Hourglass.swift
```

### Option 2: Run the compiled binary

```
swiftc Hourglass.swift -o HourglassApp
```

then,

```
./HourglassApp
```

To run in the background (detach from terminal),

```
./HourglassApp &
```


## How to stop the app?

```
ps aux | grep Hourglass
kill <pid>
```
