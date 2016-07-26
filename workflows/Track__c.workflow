<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>email_notification</fullName>
        <description>email notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>pradhan4u@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Templates/Test_Template</template>
    </alerts>
    <rules>
        <fullName>Expensive Album Aletr</fullName>
        <actions>
            <name>email_notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Work_on_this_track_record</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Track__c.Price_of_Track__c</field>
            <operation>greaterThan</operation>
            <value>20</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Track__c.CreatedDate</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Work_on_this_track_record</fullName>
        <assignedTo>pradhan4u@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Work on this track record</subject>
    </tasks>
</Workflow>
