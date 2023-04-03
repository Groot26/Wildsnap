class Strings {
  Strings._privateConstructor();

  static const appName = 'WildSnap';
  static const empty = '';
  static const getOTP = 'Get OTP';
  static const retry = 'Retry';

  //OnBoarding
  static const next = 'Next';
  static const start = 'Start';
  static const skip = 'Skip';
  static const onboardingTitle1 = 'Welcome to WildSnap!';
  static const onboardingTitle2 = 'Create Your Photo Gallery';
  static const onboardingTitle3 = 'Ready to start?';
  static const onboardingDescription1 = 'The social media app for wildlife photographers.';
  static const onboardingDescription2 = 'Show off your best wildlife shots.';
  static const onboardingDescription3 = 'Let\'s capture the wild side of nature!';

  //Dashboard
  static const home = 'Home';
  static const search = 'Search';
  static const activity = 'Activity';
  static const profile = 'Profile';

  //auth_login
  static const loginAccount = 'Login Account';
  static const loginMessage = 'Hello, welcome back to your account';
  static const mobileNumber = 'Mobile Number';
  static const password = 'Password';
  static const bio = 'Bio';
  static const login = 'Login';
  static const signup = 'Don\'t have account? \n click to create new';

  //BasicDetails
  static const almostThere = 'Almost there !';
  static const about = 'Tell some things about yourself';
  static const name = 'Name';
  static const userName = 'UserName';
  static const number = 'Mobile Number';
  static const email = 'Email';
  static const location = 'Location';
  static const caption = 'Caption';
  static const city = 'City';
  static const termsAndConditions = 'I agree to the Term and condition';
  static const referrerNumber = 'Referrer Number';
  static const address = 'Address';
  static String pinCode = 'Pincode';
  static const proceed = 'Proceed';
  static const dateOfBirth = 'Date of Birth';
}

class ErrorMessages {
  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const invalidPhone = 'Invalid Mobile number';
  static const incorrectPassword = 'Invalid Password';
  static const invalidPassword = '*Password must be 1upper,1lower,1char,1number,>8';
  static const invalidOTP = 'Invalid OTP';
  static const invalidName = 'Invalid Name';
  static const invalidUserName = 'Invalid UserName';
  static const userNameNotAvailable = 'UserName Is Not Available';
  static const userNameAvailable = 'UserName Is Available';
  static const invalidEmail = 'Invalid Email';

  static const invalidPinCode = 'Invalid Pincode';
  static const invalidAddress = 'Invalid Address';
  static const invalidCity = 'Invalid City';
  static const emptySelectedCategories =
      'Please select atleast one category to continue.';



}
