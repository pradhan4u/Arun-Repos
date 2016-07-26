<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>update_Car_availability</fullName>
        <field>Car_availanle__c</field>
        <literalValue>0</literalValue>
        <name>update Car availability</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Cars__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Driver_availability</fullName>
        <field>Driver_Available__c</field>
        <literalValue>0</literalValue>
        <name>update Driver availability</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Driver__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Update Car%2FDriver Availability</fullName>
        <actions>
            <name>update_Car_availability</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_Driver_availability</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
