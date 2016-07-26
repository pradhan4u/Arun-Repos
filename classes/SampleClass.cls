public class SampleClass
{

    
    public String TexttoParse {get;set;}  // Used Properties to Get and Set
    public String ParsedText {get;set;} // Used Properties to Get and Set
    
    public PageReference Parsefn()
    {
        ParsedText = parse(TexttoParse); // Returns the results back to Visual force Page.
        return null;
    }
    
    
    public String parse(String toParse)
     {
    
      DOM.Document doc = new DOM.Document();     // Create a Document Object
    
      try
       {
    
        doc.load(toParse);   // Loaded
    
        DOM.XMLNode root = doc.getRootElement(); // Find out the Root element of xml 
    
        return walkThrough(root); // Pass it to function for traversing.
        
    
      } 
      catch (System.XMLException e)
      {  // invalid XML
    
        return e.getMessage();
    
      }
     }
     

    public String walkThrough(DOM.XMLNode node)
    {

      String result = '\n'; // Added to put new line charater for better visibility purpose.

      if (node.getNodeType() == DOM.XMLNodeType.COMMENT) // this is for comments if any
      {

        return 'Comment (' +  node.getText() + ')';

      }

      if (node.getNodeType() == DOM.XMLNodeType.TEXT) // This refers to Attributes.
      {

        return 'Text (' + node.getText() + ')';

      }

      if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) // This refers to Elements.
      {

        result += 'Element: ' + node.getName();

        if (node.getText().trim() != '')
        {

          result += ', text=' + node.getText().trim();

        }

        if (node.getAttributeCount() > 0)
        {

          for (Integer i = 0; i< node.getAttributeCount(); i++ )
          {

            result += ', attribute #' + i + ':' + node.getAttributeKeyAt(i) + '=' + node.getAttributeValue(node.getAttributeKeyAt(i), node.getAttributeKeyNsAt(i));

          } 

        }

        for (Dom.XMLNode child: node.getChildElements()) // Get the Count of Children and Repeat the function
        {

          result += walkThrough(child);

        }

        return result;

      }

  return '';  //should never reach here

}
}