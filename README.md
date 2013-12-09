shoes-artoo-sphero
==================

Playing with controlling a sphero from shoes with the help of artoo. More to come here - it's pretty simple atm =)

So far you can let the sphero roll forward/left/right/back, stop it, change the speed and change the color - all within a nice little shoes GUI :-)

Still a bit under development/fun time. This only works for Linux/OSX due to dependencies not running on Windows. Sorry.

## Setting up

At first you should run `bundle install` in order to get all the dependencies.

Then you have to install another non ruby dependency:

```
artoo install socat
```

## Connecting to the sphero

Before running this you need to connect to the sphero. This heavily relies on the [artoo-sphero](https://github.com/hybridgroup/artoo-sphero) gem. So in order to set everything up, pair your sphero please follow the instructions from their README. The following is basically copied from their README:

### OSX

The main steps are:
- Pair your computer and the Sphero
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Sphero. You might be prompted for a passcode, but you do not need to enter it, sinec the Sphero does not check.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
```

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial Sphero-WRW 8023
```

### Ubuntu

The main steps are:
- Pair your computer and the Sphero
- Map your device to a unix port
- Use a socket to serial connection to map a TCP socket to the local unix port
- Connect to the device via Artoo

First pair your computer and Sphero. You might be prompted for a passcode, but you do not need to enter it, sinec the Sphero does not check.

Once paired, use the `artoo connect scan` command to find out your connection info:

```
$ artoo connect scan
Scanning ...
  00:06:66:4A:14:99 Sphero-WRW
```

Next, you need to bind the Sphero to the system port. In the above example, /dev/Sphero-WRW. The easiest way to do this is to use the `artoo connect bind` command:

```
artoo connect bind 00:06:66:4A:14:99 Sphero-WRW
```

Now you are ready to connect to the Sphero using the socket, in this example port 4567:

```
artoo connect serial Sphero-WRW 8023
```


## Running the app

After you have set up and connected to the sphero you have to do the following in another terminal:

**Linux:**

```
bundle exec jruby app.rb
```

**Mac:**

```
bundle exec jruby -J-XstartOnFirstThread app.rb
```

Have fun driving around. Notice that the app does not know where exactly the front of the sphero is so thinks might get interesting :-)
