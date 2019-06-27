// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import wso2/kafka;
import ballerina/io;
import ballerina/log;
import ballerina/encoding;

kafka:ConsumerConfig consumerConfigs = {
    // Here we create a consumer configs with SSL parameters
    // securityProtocol - communication protocol
    // sslTruststoreLocation - location of truststore file
    // sslTruststorePassword - truststore password
    // sslKeystoreLocation - location of keystore file
    // sslKeystorePassword - keystore password
    // sslKeyPassword - password of the private key in the key store file
    bootstrapServers:"localhost:9093",
    groupId:"group-id",
    offsetReset:"earliest",
    topics:["test-kafka-topic"],
    securityProtocol:"SSL",
    sslTruststoreLocation:"<FILE-PATH>/kafka.client.truststore.jks",
    sslTruststorePassword:"test1234",
    sslKeystoreLocation:"<FILE-PATH>/kafka.client.keystore.jks",
    sslKeystorePassword:"test1234",
    sslKeyPassword:"test1234"
};

kafka:Consumer consumer = new(consumerConfigs);

public function main(string... args) {
    // polling consumer for messages
    var results = consumer->poll(1000);
    if (results is error) {
        log:printError("Error occurred while polling ", err = results);
    } else {
        foreach var kafkaRecord in results {
            // convert byte[] to string
            byte[] serializedMsg = kafkaRecord.value;
            string msg = encoding:byteArrayToString(serializedMsg);
            io:println("Topic: " + kafkaRecord.topic + " Received Message: " + msg);
        }
    }
}
