// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Configuration related to consumer endpoint.
#
# + bootstrapServers - List of remote server endpoints of kafka brokers.
# + groupId - Unique string that identifies the consumer.
# + offsetReset - Offset reset strategy if no initial offset.
# + partitionAssignmentStrategy - Strategy class for handling the partition assignment among consumers.
# + metricsRecordingLevel - Metrics recording level.
# + metricsReporterClasses - Metrics reporter classes.
# + clientId - ID to be used for server side logging.
# + interceptorClasses - Interceptor classes to be used before sending records.
# + isolationLevel - Transactional message reading method. Use "read_committed" to read committed messages only in transactional mode when poll() is called. Use "read_uncommitted" to read all the messages, even the aborted ones.
# + topics - Topics to be subscribed by the consumer.
# + properties - Additional properties if required.
# + sessionTimeout - Timeout used to detect consumer failures when heartbeat threshold is reached.
# + heartBeatInterval - Expected time between heartbeats.
# + metadataMaxAge - Maximum time to force a refresh of metadata.
# + autoCommitInterval - Auto committing interval for commit offset, when auto-commit is enabled.
# + maxPartitionFetchBytes - The maximum amount of data per-partition the server returns.
# + sendBuffer - Size of the TCP send buffer (SO_SNDBUF).
# + receiveBuffer - Size of the TCP receive buffer (SO_RCVBUF).
# + fetchMinBytes - Minimum amount of data the server should return for a fetch request.
# + fetchMaxBytes - Maximum amount of data the server should return for a fetch request.
# + fetchMaxWait - Maximum amount of time the server will block before answering the fetch request.
# + reconnectBackoffMax - Maximum amount of time in milliseconds to wait when reconnecting.
# + retryBackoff - Time to wait before attempting to retry a failed request.
# + metricsSampleWindow - Window of time a metrics sample is computed over.
# + metricsNumSamples - Number of samples maintained to compute metrics.
# + requestTimeout - Wait time for response of a request.
# + connectionMaxIdle - Close idle connections after the number of milliseconds.
# + maxPollRecords - Maximum number of records returned in a single call to poll.
# + maxPollInterval - Maximum delay between invocations of poll.
# + reconnectBackoff - Time to wait before attempting to reconnect.
# + pollingTimeout - Timeout interval for polling.
# + pollingInterval - Polling interval for the consumer.
# + concurrentConsumers - Number of concurrent consumers.
# + defaultApiTimeout - Default API timeout value for APIs with duration.
# + autoCommit - Enables auto committing offsets.
# + checkCRCS - Check the CRC32 of the records consumed.
# + excludeInternalTopics - Whether records from internal topics should be exposed to the consumer.
# + decoupleProcessing - Decouples processing
public type ConsumerConfig record {
    string? bootstrapServers; // BOOTSTRAP_SERVERS_CONFIG 0
    string? groupId; // GROUP_ID_CONFIG 1
    string? offsetReset; // AUTO_OFFSET_RESET_CONFIG 2
    string? partitionAssignmentStrategy; // PARTITION_ASSIGNMENT_STRATEGY_CONFIG 3
    string? metricsRecordingLevel; // METRICS_RECORDING_LEVEL_CONFIG 4
    string? metricsReporterClasses; // METRIC_REPORTER_CLASSES_CONFIG 5
    string? clientId; // CLIENT_ID_CONFIG 6
    string? interceptorClasses; // INTERCEPTOR_CLASSES_CONFIG 7
    string? isolationLevel; // ISOLATION_LEVEL_CONFIG 8

    string[]? topics; // ALIAS_TOPICS 0
    string[]? properties; // PROPERTIES_ARRAY 1

    int sessionTimeout = -1; // SESSION_TIMEOUT_MS_CONFIG  0
    int heartBeatInterval = -1; // HEARTBEAT_INTERVAL_MS_CONFIG 1
    int metadataMaxAge = -1; // METADATA_MAX_AGE_CONFIG  2
    int autoCommitInterval = -1; // AUTO_COMMIT_INTERVAL_MS_CONFIG 3
    int maxPartitionFetchBytes = -1; // MAX_PARTITION_FETCH_BYTES_CONFIG 4
    int sendBuffer = -1; // SEND_BUFFER_CONFIG 5
    int receiveBuffer = -1; // RECEIVE_BUFFER_CONFIG 6
    int fetchMinBytes = -1; // FETCH_MIN_BYTES_CONFIG 7
    int fetchMaxBytes = -1; // FETCH_MAX_BYTES_CONFIG 8
    int fetchMaxWait = -1; // FETCH_MAX_WAIT_MS_CONFIG 9
    int reconnectBackoffMax = -1; // RECONNECT_BACKOFF_MAX_MS_CONFIG 10
    int retryBackoff = -1; // RETRY_BACKOFF_MS_CONFIG 11
    int metricsSampleWindow = -1; // METRICS_SAMPLE_WINDOW_MS_CONFIG 12
    int metricsNumSamples = -1; // METRICS_NUM_SAMPLES_CONFIG 13
    int requestTimeout = -1; // REQUEST_TIMEOUT_MS_CONFIG 14
    int connectionMaxIdle = -1; // CONNECTIONS_MAX_IDLE_MS_CONFIG 15
    int maxPollRecords = -1; // MAX_POLL_RECORDS_CONFIG 16
    int maxPollInterval = -1; // MAX_POLL_INTERVAL_MS_CONFIG 17
    int reconnectBackoff = -1; // RECONNECT_BACKOFF_MAX_MS_CONFIG 18
    int pollingTimeout = -1; // ALIAS_POLLING_TIMEOUT 19
    int pollingInterval = -1; // ALIAS_POLLING_INTERVAL 20
    int concurrentConsumers = -1; // ALIAS_CONCURRENT_CONSUMERS 21
    int defaultApiTimeout = 30000; // DEFAULT_API_TIMEOUT_MS_CONFIG 22

    boolean autoCommit = true; // ENABLE_AUTO_COMMIT_CONFIG 0
    boolean checkCRCS = true; // CHECK_CRCS_CONFIG 1
    boolean excludeInternalTopics = true; // EXCLUDE_INTERNAL_TOPICS_CONFIG 2
    boolean decoupleProcessing;                 // ALIAS_DECOUPLE_PROCESSING
    !...
};

# Type related to consumer record.
#
# + key - Key that is included in the record.
# + value - Record content.
# + offset - Offset value.
# + partition - Partition in which the record is stored.
# + timestamp - Timestamp of the record, in milliseconds since epoch.
# + topic - Topic to which the record belongs to.
public type ConsumerRecord record {
    byte[] key;
    byte[] value;
    int offset;
    int partition;
    int timestamp;
    string topic;
    !...
};

# Kafka consumer service object.
public type Consumer object {

    # Returns the endpoint bound to service.
    #
    # + return - Kafka consumer endpoint bound to the service.
    public function getEndpoint() returns SimpleConsumer {
        SimpleConsumer consumer = new();
        return consumer;
    }
};

# Represent a Kafka consumer endpoint.
#
# + consumerConfig - Used to store configurations related to a Kafka connection.
public type SimpleConsumer client object {
    public ConsumerConfig? consumerConfig = ();

    # Starts the consumer endpoint.
    public function start() {}

    # Stops the consumer endpoint.
    #
    # + return - Returns an error if encounters an error, returns nil otherwise
    public function stop() returns error?{
        check self->close();
        return;
    }

    remote function initEndpoint() returns error?{
        match self.consumerConfig.bootstrapServers {
            () => {
                //do nothing
            }
            string servers => {
                check self->connect();
            }
        }

        match self.consumerConfig.topics {
            () => {
                //do nothing
            }
            string[] topics => {
                check self->subscribe(topics);
            }
        }
        return;
    }

    # Registers a listener to the Kafka service.
    extern function registerListener(typedesc serviceType);

    # Assigns consumer to a set of topic partitions.
    #
    # + partitions - Topic partitions to be assigned.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function assign(TopicPartition[] partitions) returns error?;

    # Closes consumer connection to the external Kafka broker.
    #
    # + duration - Timeout duration for the close operation execution.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote  extern function close(int duration = -1) returns error?;

    # Commits current consumed offsets for consumer.
    remote extern function commit();

    # Commits given offsets and partitions for the given topics, for consumer.
    #
    # + duration - Timeout duration for the commit operation execution.
    # + offsets - Offsets to be commited.
    remote extern function commitOffset(PartitionOffset[] offsets, int duration = -1);

    # Connects consumer to the provided host in the consumer configs.
    #
    # + return - Returns an error if encounters an error, returns nill otherwise.
    remote extern function connect() returns error?;

    # Returns the currently assigned partitions for the consumer.
    #
    # + return - Array of assigned partitions for the consumer if executes successfully, error otherwise.
    remote extern function getAssignment() returns TopicPartition[]|error;

    # Returns the available list of topics for a particular consumer.
    #
    # + duration - Timeout duration for the get available topics execution.
    # + return - Array of topics currently available (authorized) for the consumer to subscribe.
    remote extern function getAvailableTopics(int duration = -1) returns string[]|error;

    # Returns start offsets for given set of partitions.
    #
    # + partitions - Array of topic partitions to get the starting offsets.
    # + duration - Timeout duration for the get beginning offsets execution.
    # + return - Starting offsets for the given partitions if executes successfully, error otherwise.
    remote extern function getBeginningOffsets(TopicPartition[] partitions, int duration = -1)
                               returns PartitionOffset[]|error;

    # Returns last committed offsets for the given topic partitions.
    #
    # + partition - Topic partition in which the committed offset is returned for consumer.
    # + duration - Timeout duration for the get committed offset operation to execute.
    # + return - Committed offset for the consumer for the given partition if executes successfully, error otherwise.
    remote extern function getCommittedOffset(TopicPartition partition, int duration = -1)
                               returns PartitionOffset|error;

    # Returns last offsets for given set of partitions.
    #
    # + partitions - Set of partitions to get the last offsets.
    # + duration - Timeout duration for the get end offsets operation to execute.
    # + return - End offsets for the given partitions if executes successfully, error otherwise.
    remote extern function getEndOffsets(TopicPartition[] partitions, int duration = -1)
                               returns PartitionOffset[]|error;

    # Returns the partitions, which are currently paused.
    #
    # + return - Set of partitions paused from message retrieval if executes successfully, error otherwise.
    remote extern function getPausedPartitions() returns TopicPartition[]|error;

    # Returns the offset of the next record that will be fetched, if a records exists in that position.
    #
    # + partition - Topic partition in which the position is required.
    # + duration - Timeout duration for the get position offset operation to execute.
    # + return - Offset which will be fetched next (if a records exists in that offset).
    remote extern function getPositionOffset(TopicPartition partition, int duration = -1) returns int|error;

    # Returns set of topics wich are currently subscribed by the consumer.
    #
    # + return - Array of subscribed topics for the consumer if executes successfully, error otherwise.
    remote extern function getSubscription() returns string[]|error;

    # Retrieve the set of partitions in which the topic belongs.
    #
    # + topic - Given topic for partition information is needed.
    # + duration - Timeout duration for the get topic partitions operation to execute.
    # + return - Array of partitions for the given topic if executes successfully, error otherwise.
    remote extern function getTopicPartitions(string topic, int duration = -1) returns TopicPartition[]|error;

    # Pause consumer retrieving messages from set of partitions.
    #
    # + partitions - Set of partitions to pause the retrieval of messages.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function pause(TopicPartition[] partitions) returns error?;

    # Poll the consumer for external broker for records.
    #
    # + timeoutValue - Polling time in milliseconds.
    # + return - Array of consumer records if executes successfully, error otherwise.
    remote extern function poll(int timeoutValue) returns ConsumerRecord[]|error;

    # Resume consumer retrieving messages from set of partitions which were paused earlier.
    #
    # + partitions - Set of partitions to resume the retrieval of messages.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function resume(TopicPartition[] partitions) returns error?;

    # Seek the consumer for a given offset in a topic partition.
    #
    # + offset - PartitionOffset to seek.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function seek(PartitionOffset offset) returns error?;

    # Seek consumer to the beginning of the offsets for the given set of topic partitions.
    #
    # + partitions - Set of topic partitions to seek.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function seekToBeginning(TopicPartition[] partitions) returns error?;

    # Seek consumer for end of the offsets for the given set of topic partitions.
    #
    # + partitions - Set of topic partitions to seek.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function seekToEnd(TopicPartition[] partitions) returns error?;

    # Subscribes the consumer to the provided set of topics.
    #
    # + topics - Array of topics to be subscribed.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function subscribe(string[] topics) returns error?;

    # Subscribes the consumer to the topics which matches to the provided pattern.
    #
    # + regex - Pattern which should be matched with the topics to be subscribed.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function subscribeToPattern(string regex) returns error?;

    # Subscribes to consumer to the provided set of topics with rebalance listening is enabled.
    #
    # + topics - Array of topics to be subscribed.
    # + onPartitionsRevoked - Function which will be executed if partitions are revoked from this consumer.
    # + onPartitionsAssigned - Function which will be executed if partitions are assigned this consumer.
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function subscribeWithPartitionRebalance(string[] topics,
                           function(TopicPartition[] partitions) onPartitionsRevoked,
                           function(TopicPartition[] partitions) onPartitionsAssigned)
                           returns error?;

    # Unsubscribe the consumer from all the topic subscriptions.
    #
    # + return - Returns an error if encounters an error, returns nil otherwise.
    remote extern function unsubscribe() returns error?;
};
