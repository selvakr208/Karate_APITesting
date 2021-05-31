function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
        apiURL: 'https://5f99522350d84900163b8737.mockapi.io/tech-test/'
  }
  if (env == 'dev') {

    //  Enter the configuration details which needs to be used for Dev environment

  } 
  if (env == 'qa') {

    //  Enter the configuration details which needs to be used for Dev environment
  }

 
  return config;
}