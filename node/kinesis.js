var Twitter = require('twitter');
var AWS = require('aws-sdk');

var credentials = new AWS.SharedIniFileCredentials({profile: process.env.AWS_PROFILE});
AWS.config.credentials = credentials;
AWS.config.region = process.env.AWS_REGION;

var kinesis = new AWS.Kinesis();

var client = new Twitter({
    consumer_key: process.env.TWITTER_CONSUMER_KEY,
    consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
    access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY,
    access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
});

var stream = client.stream('statuses/filter', {
    track: 'cat',
    language: 'en'
});

stream.on('data', function (event) {
    if (event.text) {
        var record = JSON.stringify({
            id: event.id,
            timestamp: event['created_at'],
            tweet: event.text.replace(/["'}{|]/g, '') //either strip out problem characters or base64 encode for safety 
        }) + '|'; // record delimiter

        kinesis.putRecord({
            Data: record,
            StreamName: 'acme-twitter-stream',
            PartitionKey: 'key'
        }, function (err, data) {
            if (err) {
                console.error(err);
            }
            console.log('sending: ', event.text);
        });
    }
});

stream.on('error', function (error) {
    throw error;
});