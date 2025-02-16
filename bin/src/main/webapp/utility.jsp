<script>
	
	// Function to convert a number to words
	function numberToWords(num) {
	    const ones = [
	        "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", 
	        "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", 
	        "Seventeen", "Eighteen", "Nineteen"
	    ];
	    const tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];
	    const scales = ["", "Thousand", "Lakh", "Crore"];

	    if (num === 0) return "Zero";

	    const numStr = num.toString();
	    const numArray = numStr.split(".");
	    const integerPart = parseInt(numArray[0], 10);
	    const decimalPart = numArray[1] ? parseInt(numArray[1], 10) : null;

	    let result = "";

	    // Helper function to convert numbers below 1000
	    function convertBelowThousand(num) {
	        let str = "";

	        if (num > 99) {
	            str += ones[Math.floor(num / 100)] + " Hundred ";
	            num %= 100;
	        }

	        if (num > 19) {
	            str += tens[Math.floor(num / 10)] + " ";
	            num %= 10;
	        }

	        if (num > 0) {
	            str += ones[num] + " ";
	        }

	        return str.trim();
	    }

	    // Handle the integer part
	    let scaleIndex = 0;
	    let remainingNum = integerPart;

	    while (remainingNum > 0) {
	        const chunk = remainingNum % 1000;

	        if (chunk > 0) {
	            result = convertBelowThousand(chunk) + " " + scales[scaleIndex] + " " + result;
	        }

	        remainingNum = Math.floor(remainingNum / 1000);
	        scaleIndex++;
	    }

	    result = result.trim();

	    // Handle the decimal part
	    if (decimalPart !== null) {
	        result += " and " + convertBelowThousand(decimalPart) + " Paise";
	    }

	    return result.trim();
	}

</script>
