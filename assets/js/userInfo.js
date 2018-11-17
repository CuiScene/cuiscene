const k = kyanite

$(document).ready(function () {
  const create = user => {
    $.ajax({
      type: 'POST',
      url: '/api/users/create',
      data: {
        username_pk: localStorage.nickname,
        date_created: timestamp
      }
    })
      .then(response => {
        console.log(response)
      })
  }

  const exists = user => {
    $.ajax({
      type: 'GET',
      url: '/api/users'
    })
      .then(response => {
        return new Promise((resolve, reject) => {
          if (k.some(x => x.username_pk === user, response)) {
            reject(Error)
          } else {
            resolve(
              create(localStorage.nickname)
            )
          }
        })
      })
  }

  exists(localStorage.nickname)
})
