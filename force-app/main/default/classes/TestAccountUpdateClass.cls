@isTest
public class TestAccountUpdateClass{
            @isTest
            static void testUpdateAccount(){
                
                Account account = new Account ();
                account.Name = 'Test Account';
                    insert account;
                
                // Test  functionality
                AccountUpdateClass accobj = new AccountUpdateClass();
                accobj.updateAccount(account.Id);
                //validate actual & expected results
                account= [SELECT Name FROM Account WHERE Id =:account.Id];
                System.assertEquals('Test Account-MyFirstAccount', account.Name);
                
            }
}