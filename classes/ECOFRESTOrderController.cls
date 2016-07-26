/**
 * Class Name: ECOFRESTOrderController
 * @author: Kristine Campang,Lloyd de Castro,Jb Domingo,Karla Haldos
 * Date: 06/09/2014
 * @description This class is used to process the JSON response from shopping cart.
 * History: <defect #> <author> <date updated> <description>
 *          72290 KEvasco 07/02/14 Used Product Id instead of Product Code
 *          D-0487 KEvasco 07/03/14 Populate Order Line Item Start Date if Status Message is Success
 */
@RestResource(urlMapping='/Order/*')
global with sharing class ECOFRESTOrderController 
{  
    /**
    *@Description: This method processes the request provided, throws appropriate HTTP status code if needed. If there are any errors/exception thrown, all changes made should be reverted.
    *@Param: None
    *@Return: None
    *@Throws Exception: Exception - e
    */  
    @HTTPPost 
    global static void doPostSaveOrder()
    { 
        RestRequest request = RestContext.request;    
        RestResponse response = RestContext.response; 
        String requestBody = request.requestBody.toString().trim();
            system.debug('********* received JSON payload ****'+request.requestBody.toString());
        String resultStr = '';
        Savepoint savePoint = Database.setSavePoint();
        
        try
        {
            processSaveOrder(requestBody);
        }
        catch(Exception e)
        {
            Database.rollback(savePoint);
            response.statusCode = 500;      
            response.responseBody = Blob.valueOf(JSON.serialize(string.valueOf(e)));
            resultStr = string.valueOf(e);
                system.debug('************* exception '+e+'  '+e.getStackTraceString());
                system.debug('******JSON payload ***' + requestBody);
            return;
        }       
        response.statusCode = 200;                          
    } 
    
        /**
    *@Description:This method parses the order data in the request body and creates order and line item objects.
    *@Param: requestBody – a string data of the order structure in JSON format
    *@Return: None
    *@Throws Exception: throws Exception(“order Id not provided”) when orderId does not contain any value.
    *@Throws Exception: throws Exception(“Invalid Order Status”) when status of the orderObject is not equal to "New" or “Saved-Incomplete”
    */
    public static void processSaveOrder(String requestBody)
    {  
        Map<String, Object> requestJson = (Map<String, Object>)JSON.deserializeUntyped(requestBody);
                Map<String, Object> orderInformation = (Map<String, Object>)requestJson.get(ECOFGlobalVariable.ORDER_INFORMATION); //Gets Order_Information from requestJson
        String orderId = (string)orderInformation.get(ECOFGlobalVariable.ORDER_ID); //Gets  ORDER_ID from the orderInformation map. 
        system.debug('******orderId ***' + orderId);
    }
}