[#ftl output_format="HTML"] <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Sign_In_and_Sign_Up</title>
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css"
          type="text/css"
        />
      </head>
      <body>
        <div class="md:h-screen bg-white relative flex flex-col justify-center items-center">
          <div
            class="md:border md:border-gray-300 bg-white md:shadow-lg shadow-none rounded p-10 align-middle"
          >
            <div class="flex flex-col items-center space-y-3">
              <div class="flex"><img src="https://gluu.org/wp-content/uploads/2020/12/logo.png" /></div>
              <span class="text-2xl font-semi-bold leading-normal">Sign in</span>
              <p class="leading-normal">Use your Email</p>
            </div>
            <form method="post" class="my-8" onsubmit="return handleFormValidation()">
              <div class="relative mb-2">
                <label for="email" class="label leading-tighter text-gray-600 text-base cursor-text">
                  Email
                </label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  autofocuss
                  class="w-full rounded px-3 border border-gray-300 pt-2 pb-2"
                />
              </div>
              <div class="space-y-9">
                <div><a href="#" class="text-sm font-bold text-green-500">Forgot email?</a></div>
                <div class="text-sm">
                  <p>Not your computer? Use Guest mode to sign in privately.</p>
                  <a href="#" class="font-bold text-green-500">Learn more</a>
                </div>
                <div class="text-sm flex justify-between items-center">
                  <a
                    href="#"
                    class="font-bold text-green-500 py-2 px-2 rounded -ml-2 hover:bg-green-50 hover:text-green-700"
                    >Create account</a
                  ><button
                    type="submit"
                    class="py-2 px-6 rounded text-white btn bg-green-500 hover:bg-green-600"
                  >
                    Next
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </body>
    </html>
    <script>
      function handleFormValidation() {
        var email = document.getElementById('email').value
        if (email === '') {
          alert('Email is required')
          return false
        }
        return true
      }
    </script>
    