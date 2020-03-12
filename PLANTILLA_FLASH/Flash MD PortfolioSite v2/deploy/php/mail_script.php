<?php
/**
*
* MD PortfolioSite - Contact Form PHP Script [build1.0]
* Copyright (c) 2007 D. Molanphy, Molanphy Design
* 
* This software may be used in personal and commercial projects provided the 
* source code retains the above copyright notice.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
* NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*
* This script handles the PHP end of the contact form. 
* YOU SHOULD CHANGE THE $to VALUE TO YOUR OWN EMAIL ADDRESS!!!
* 
*
*/
	// set this to your email address
	$to = "youremailhere@yoursite.com";

	// shouldn't need to change anything past this line
	$from = $_POST['formName'];
	$email = $_POST['formEmail'];
	$message = $_POST['formMessage'];
	$headers = "From: " . $_POST['formName'] . " <" . $_POST['formEmail'] . ">\n";

	// set the message to whatever you'd like
	$subject = "Message from MD Portfolio Site";

	$body = "From: $from\n E-Mail: $email\n Message:\n\n $message";
	mail($to, $subject, $body, $headers);

	$sendStatus = "success";
	echo $sendStatus;

?>