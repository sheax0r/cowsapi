# Cowsapi

Runs an HTTP API that exposes cowsay operations.
Make cows say things, just like you always wanted to - over the internets!

## Features
* Make cows say things!
* Supports both text and images of cows!

## Installation
To install cowsapi:
```bash
gem install cowsapi
```

## Usage
To launch cowsapi:
```bash 
port=9292 cowsapi
```

This will launch cowsapi on port 9292.

### API Guide 

#### List cows:
```bash
curl -O http://localhost
```

#### Make a cow say stuff:
```bash
curl -O http://localhost/somecow/stuff%20to%20say
```

#### Get a an image of a cow saying stuff:
```bash
curl -o curl -O http://sheax0r.ca/cow/stuff?format\=png > cowstuff.png
```

### Extra stuff
You can also make your docker-cowsay container run cowsay directly, rather than launching an api, like so:

```
docker run -t cowsay i can haz cows?

_________________
< i can haz cows? >
 -----------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cowsapi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
