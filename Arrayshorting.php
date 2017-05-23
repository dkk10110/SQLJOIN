<?php

function sortArray() {
	$inputArray = array(8, 2, 7, 4, 5, 55, 6, 11, 78, 2, 41);
	$outpotArray = array();
	for ($x = 1; $x <= 100; $x++) {
		if (in_array($x, $inputArray)) {
			array_push($outpotArray, $x);
		}
	}
	return $outpotArray;
}
$sortArray = sortArray();
foreach ($sortArray as $key => $value) {

	$arrayValue[] = $value;
}

?>
