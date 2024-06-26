@isTest
public class unitTesting {
    static testMethod void testMyFunction() {
        // Call the function you want to test
        Addition obj=new Addition(); 
        Integer actualResult = obj.Add(5,5);
        
        // Define the expected result
        Integer expectedResult = 10;
        
        // Use System.assertEquals to compare actual and expected results
        System.assertEquals(expectedResult, actualResult, 'The result should be 5.');
    }
}