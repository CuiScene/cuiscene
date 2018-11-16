
// Code for Auth0 - DO NOT DELETE
window.addEventListener('load', function () {
  var webAuth = new auth0.WebAuth({
    domain: 'apmtpc.auth0.com',
    clientID: '046ZkHPSyfy19YrgJDHsxYgeXWWsq421',
    responseType: 'token id_token',
    scope: 'openid profile',
    redirectUri: 'http://localhost:8080'
  })

  var loginBtn = document.getElementById('btn-login')
  var homeDiv = document.getElementById('homeDiv')
  var profileDiv = document.getElementById('profileDiv')
  var profileButton = document.getElementById('btn-profile')

  loginBtn.addEventListener('click', function (e) {
    e.preventDefault()
    webAuth.authorize()
  })

  var loginStatus = document.querySelector('.container h4')
  var loginView = document.getElementById('login-view')
  var homeView = document.getElementById('home-view')

  // buttons and event listeners
  var homeViewBtn = document.getElementById('btn-home-view')
  var logoutBtn = document.getElementById('btn-logout')

  homeViewBtn.addEventListener('click', function () {
    homeView.style.display = 'inline-block'
    loginView.style.display = 'none'
  })

  logoutBtn.addEventListener('click', logout)

  function handleAuthentication() {
    webAuth.parseHash(function (err, authResult) {
      if (authResult && authResult.accessToken && authResult.idToken) {
        window.location.hash = ''
        setSession(authResult)
        loginBtn.style.display = 'none'
        homeView.style.display = 'inline-block'
      } else if (err) {
        homeView.style.display = 'inline-block'
        console.log(err)
        alert('Error: ' + err.error + '. Check the console for further details.')
      }
      displayButtons()
    })
  }

  function setSession(authResult) {
    // Set the time that the Access Token will expire at
    var expiresAt = JSON.stringify(
      authResult.expiresIn * 1000 + new Date().getTime()
    )
    localStorage.setItem('access_token', authResult.accessToken)
    localStorage.setItem('id_token', authResult.idToken)
    localStorage.setItem('expires_at', expiresAt)
  }

  function logout() {
    // Remove tokens and expiry time from localStorage
    localStorage.removeItem('access_token')
    localStorage.removeItem('id_token')
    localStorage.removeItem('expires_at')
    displayButtons()
  }

  function isAuthenticated() {
    // Check whether the current time is past the
    // Access Token's expiry time
    var expiresAt = JSON.parse(localStorage.getItem('expires_at'))
    return new Date().getTime() < expiresAt
  }

  function displayButtons() {
    if (isAuthenticated()) {
      loginBtn.style.display = 'none'
      homeDiv.style.display = 'none'
      profileDiv.style.display = 'inline-block'
      profileButton.style.display = 'inline-block'
      logoutBtn.style.display = 'inline-block'
      loginStatus.innerHTML = 'You are logged in!'
    } else {
      homeDiv.style.display = 'inline-block'
      profileDiv.style.display = 'none'
      profileButton.style.display = 'none'
      loginBtn.style.display = 'inline-block'
      logoutBtn.style.display = 'none'
    }
  }

  // app.js
  var userProfile
  function getProfile() {
    if (!userProfile) {
      var accessToken = localStorage.getItem('access_token')

      if (!accessToken) {
        console.log('Access Token must exist to fetch profile')
      }

      webAuth.client.userInfo(accessToken, function (err, profile) {
        if (err) {
          throw err
        }
        if (profile) {
          userProfile = profile
          displayProfile()
        }
      })
    } else {
      displayProfile()
    }
  }

  function displayProfile() {
    // display the profile
    document.querySelector('#profile-view .nickname').innerHTML =
      userProfile.nickname

    document.querySelector(
      '#profile-view .full-profile'
    ).innerHTML = JSON.stringify(userProfile, null, 2)

    document.querySelector('#profile-view img').src = userProfile.picture
  }

  handleAuthentication()
  getProfile()
})
