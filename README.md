# firebase-emulators

This is a Firebase Emulator docker image for testing firebase projects

This image contains all current firebase emulators(as of 2020-04-30)

Run from your firebase project root directory:

!!! FOR THIS TO WORK YOU NEED TO COPY THE `emulators` SECTION OF THIS PROJECT'S [firebase.json](https://github.com/wesleyakio/firebase-emulators/blob/master/firebase.json) INTO YOUR OWN !!!.
```sh
docker run -it --rm -v $(PWD):/app --name tst -p9000:9000 -p4400:4400 -p5001:5001 -p8080:8080 -p8085:8085 -p4000:4000 -p4500:4500 wesleyakio/firebase-emulators:8.2.0-2alpine
```

After startup, direct your browser to http://0.0.0.0:4000/ and check out the beautiful very _**EXPERIMENTAL**_ Firebase Emulator GUI brought to you by the awesome guys at Firebase.

The command above will map the ports for all the available services, if you don't need them then you can remove some of the the -p port maps. Each port corresponds to a service, you can find port vs service mappings in them in this project's [firebase.json](https://github.com/wesleyakio/firebase-emulators/blob/master/firebase.json)

If you need to restore your data into the realtime database, you can do so by running:

```sh
curl -X PUT -d @your-data.json -H "Content-Type: application/json" http://localhost:9000/.json > /dev/null
```

This image has a `Xmx` of 3GB for the Realtime database, so you should be able to import JSON files of up to 250MB into the database, if you need more than that then good luck :/
