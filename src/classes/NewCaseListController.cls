public class NewCaseListController {
    public List<Case> getNewCases(){
        List<Case> newCases = [Select CaseNumber from Case where Status = 'New'];
        return newCases;
    }
}