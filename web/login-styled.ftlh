[#ftl output_format="HTML"]
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Login Page
	</title><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2/dist/tailwind.min.css" type="text/css"></head>
<body>

  
	
	
	
	
	
  
  
	<div class="min-h-screen bg-white-100 py-6 flex flex-col justify-center sm:py-12">
	  <div class="relative py-3 sm:max-w-xl sm:mx-auto">
		<div class="absolute inset-0 bg-green-500 bg-gradient-to-r from-cyan-400 to-sky-500 shadow-lg transform -skew-y-6 sm:skew-y-0 sm:-rotate-6 sm:rounded-3xl">
		</div>
		<div class="relative px-4 py-10 bg-white shadow-lg sm:rounded-3xl sm:p-20">
		  <div class="max-w-md mx-auto">
			<div>
			  <h1 class="text-2xl font-semibold">Sign into your account
			  </h1>
			</div>
			<div class="divide-y divide-gray-200">
			  <div class="py-8 text-base leading-6 space-y-4 text-gray-700 sm:text-lg sm:leading-7">
				<form method="post" class="my-8">
				  <div class="relative">
					<label for="username" class="absolute left-0 -top-3-5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3-5 peer-focus:text-gray-600 peer-focus:text-sm -top-5-8">Username</label>
					<input type="text" autocomplete="off" id="username" name="username" class="peer rounded h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600">
				  </div>
				  <div class="relative">
					<input type="password" autocomplete="off" id="password" name="password" class="peer rounded h-10 w-full border-b-2 border-gray-300 text-gray-900 focus:outline-none focus:borer-rose-600">
					<label for="password" class="absolute left-0 -top-3-5 text-gray-600 text-sm peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-440 peer-placeholder-shown:top-2 transition-all peer-focus:-top-3-5 peer-focus:text-gray-600 peer-focus:text-sm">Password</label>
				  </div>
				  <div class="relative">
					<div class="text-sm flex justify-center items-center">
					  <button type="submit" class="py-2 px-6 rounded text-white btn bg-green-500 hover:bg-green-600 button-gradient">
						Submit
					  </button>
					</div>
				  </div>
				</form>
			  </div>
			</div>
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