//Generated by wsdl2apex

public class AsyncNflOttTransaction {
    public class fetchByAccountResponse_elementFuture extends System.WebServiceCalloutFuture {
        public NflOttTransaction.fetchByAccountResponse_element getValue() {
            NflOttTransaction.fetchByAccountResponse_element response = (NflOttTransaction.fetchByAccountResponse_element)System.WebServiceCallout.endInvoke(this);
            return response;
        }
    }
    public class AsyncTransactionPort {
        public String endpoint_x = 'https://soap.vindicia.com/soap.pl';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://soap.vindicia.com/v9_0/Transaction', 'NflOttTransaction', 'http://soap.vindicia.com/v9_0/Vindicia', 'NflOttVindicia'};
        public AsyncNflOttTransaction.fetchByAccountResponse_elementFuture beginFetchByAccount(System.Continuation continuation,NflOttVindicia.Authentication auth,NflOttVindicia.Account account,Boolean includeChildren) {
            NflOttTransaction.fetchByAccount_element request_x = new NflOttTransaction.fetchByAccount_element();
            request_x.auth = auth;
            request_x.account = account;
            request_x.includeChildren = includeChildren;
            return (AsyncNflOttTransaction.fetchByAccountResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncNflOttTransaction.fetchByAccountResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://soap.vindicia.com/v9_0/Transaction#fetchByAccount',
              'http://soap.vindicia.com/v9_0/Transaction',
              'fetchByAccount',
              'http://soap.vindicia.com/v9_0/Transaction',
              'fetchByAccountResponse',
              'NflOttTransaction.fetchByAccountResponse_element'}
            );
        }
    }
}