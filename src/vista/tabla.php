<?php
include ("../controlador/index2.php");
$var=(isset($_POST['page']))?$_POST['page']:"productos";
$todo=modeloController::tabla($var);
$encabezados=$todo[0];
$filas=$todo[1];
?>

 
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <caption class="p-5 text-lg font-semibold text-left rtl:text-right text-gray-900 bg-white dark:text-white dark:bg-gray-800">
             Lista de <?= $var ?>
            <p class="mt-1 text-sm font-normal text-gray-500 dark:text-gray-400"></p>
        </caption>
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <?php
                    foreach($encabezados as $encabezado){?>
                    <th scope="col" class="px-6 py-3">
                       <?= $encabezado  ?>
                    </th>
                <?php } ?>
                
            </tr>
        </thead>
        <tbody>
            <?php
                foreach ($filas as $fila) {?>
                   <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                   <?php  foreach ($fila as $dato) {?>
                        <td scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            <?= $dato ?>
                        </td>
                    <?php }?>
                    </tr>
            <?php } ?>  
            
                
           
        </tbody>
    </table>
</div>
