<!DOCTYPE html>
<html lang="en" class="dark" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="output.css">
    
</head>
<body>
    <section class="bg-gray-50 dark:bg-[#2a2a2a] h-[100dvh] ">
        <div class="flex flex-row items-center justify-center px-6 py-8 mx-auto md:h-screen lg:py-0 h-[100vh] gap-8">
            <div class="sm:flex-1 flex justify-end flex-none">
            <!-- login -->
            <div class="w-full bg-white rounded-lg shadow dark:border md:mt-0 sm:max-w-md xl:p-0 dark:bg-[#3c3c3c] dark:border-gray-700">
                <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                    <div  class="flex  justify-center items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white sm:justify-start">
                        <img class="w-[180px]  mr-2" src="img/logoBlanco.webp" alt="logo">
                        
                    </div>
                    <h1 class=" text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl dark:text-white">
                        Bienvenido a Inventarios
                    </h1>
                    <form class="space-y-4 md:space-y-6" action="#" method="post" id="login">
                        <div>
                            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nombre de usuario</label>
                            <input type="text" name="username" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="username" required="">
                        </div>
                        <div>
                            <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Contraseña</label>
                            <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">
                        </div>
                        <div class="hidden">
                            <input type="text" name="peticion" value="login">
                        </div>
                      
                        <button type="submit" class="w-full text-white bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 dark:bg-[#2a2a2a]">Ingresar</button>
                       
                    </form>
                    <h4 class="text-white mt-2">
                        
                        <?php
                        $mensaje=(isset($mensaje) && !empty($mensaje))? $mensaje : "";
                        echo $mensaje;
                        ?>
                    </h4>
                </div>
            </div>
        </div>
            <!-- img -->
             <div class="flex-1 sm:flex hidden justify-center ">
                <img src="img/imgLogin.png" alt="" class=" w-[100%]  xl:w-[70%] [mask-image:linear-gradient(black_0%,transparent_100%)] saturate-150">
             </div>
        </div>
      </section>
      
</body>
</html>