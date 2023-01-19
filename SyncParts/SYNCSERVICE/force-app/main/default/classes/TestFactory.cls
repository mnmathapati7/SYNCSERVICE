@isTest
public class TestFactory {
    public static User generateUser(String profileName){
    UserRole userRole = new UserRole(DeveloperName = 'TestingTeam', Name = 'Testing Team');
    insert userRole;
    User u = new User(
      ProfileId = [SELECT Id FROM Profile WHERE Name = :profileName].Id,
      LastName = 'last',
      Email = 'Cpt.Awesome@awesomesauce.com',
      Username = 'Cpt.Awesome@awesomesauce.com',
      CompanyName = 'Testing Co',
      Title = 'Captian',
      Alias = 'alias',
      TimeZoneSidKey = 'America/Los_Angeles',
      EmailEncodingKey = 'UTF-8',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      UserRoleId = userRole.Id
    );
    insert u;
    return u;
  }
}