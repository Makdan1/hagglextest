class Mutations {
  String login = """
mutation signIn(\$input:String!,\$password:String!){
login(data: {input:\$input,password:\$password}){
token,
}
}
""";

  String register = """
   mutation register(\$email:String!,\$username:String!,\$password:String!,\$phonenumber:String!,\$referralCode:String,\$country:String!,\$currency:String!,\$PhoneNumberDetailsInput:PhoneNumberDetailsInput!){
        register(
          data: {
            email: \$email,
            username:\$username,
            password:\$password,
            phonenumber: \$phonenumber,
            referralCode: \$referralCode,
            phoneNumberDetails: \$PhoneNumberDetailsInput,
            country:  \$country,
            currency:\$currency
          }){
          user{
            _id
            email
            username
            emailVerified
            phoneNumberVerified
          }
          token
        }
       
      }
    """;

  String verify = """
mutation verifyUser(\$code:Int!){
verifyUser(data: {code:\$code}){
}
}
""";

  String resendVerification = """
query resendVerificationCode(\$email:String!){
resendVerificationCode(data: {email:\$email})
}
""";

  String country = """
  query GetActiveCountries {
  getActiveCountries {
  _id,
  name,
      callingCode,
  currencyCode,
  flag
}
}
""";
}
