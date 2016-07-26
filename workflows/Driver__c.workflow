<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_alert_to_manager</fullName>
        <description>Send email alert to manager</description>
        <protected>false</protected>
        <recipients>
            <recipient>Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Templates/Calculate_Driver_Salary</template>
    </alerts>
    <rules>
        <fullName>Remind Manager to calculate Salary</fullName>
        <actions>
            <name>Send_email_alert_to_manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>DAY(TODAY())  = 1</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
