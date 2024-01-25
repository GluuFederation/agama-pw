[#ftl output_format="HTML"]
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Login Page
	</title><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" type="text/css"></head>
<body>

  
	
	
	
	
	
  
  
	<div class="min-h-screen bg-red-100 py-6 flex flex-col justify-center sm:py-12">
	  <div class="relative py-3 sm:max-w-xl sm:mx-auto">
		<div class="absolute inset-0 bg-gradient-to-r from-cyan-400 to-sky-500 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl">
		</div>
		<div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
		  <div class="max-w-md mx-auto">
			<div>
			  <h1 class="text-2xl font-semibold">Sign into your account
			  </h1>
			</div>
			<div class="divide-y divide-gray-200">
			  <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
				<div class="relative">
				  <input type="text" autocomplete="off" id="username" name="username" placeholder="username" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600">
				  <label for="email" class="absolute left-0 -top-3-5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3-5 peer-focus:text-gray-600 peer-focus:text-sm">Username</label>
				</div>
				<div class="relative">
				  <input type="password" autocomplete="off" id="password" name="password" placeholder="Password" class="peer placeholder-transparent h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600">
				  <label for="password" class="absolute left-0 -top-3-5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3-5 peer-focus:text-gray-600 peer-focus:text-sm">Password</label>
				</div>
				<div class="relative">
				  <button type="button" class="bg-cyan-500 text-blue rounded-md px-2 py-1">Submit</button>
				</div>
			  </div>
			</div>
		  </div>
		  <div class="w-full flex justify-center">
		  </div>
		</div>
	  </div>
	</div>
  
  
</body>

<script>
	window.onload = function () {
	  var form = document.querySelector("form");
	  form.onsubmit = handleFormValidation;
	};
	function handleFormValidation() {
	  var username = document.getElementById('username').value
	  if (username === '') {
		alert('Username is required')
		return false
	  }
	  var password = document.getElementById('password').value
	  if (password === '') {
		alert('Password is required')
		return false
	  }
	  return true
	}
  </script>
</html>