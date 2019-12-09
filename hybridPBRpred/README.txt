This script produces combined predictions from SCRIBER and disoRDPbind predictor.


First, the user should adopt structure-based SCRIBER at 
http://biomine.cs.vcu.edu/servers/SCRIBER/
and disordered-based disoRDPbind at
http://biomine.cs.vcu.edu/servers/DisoRDPbind/
to obain the putative protein-binding probabilities, respectively.
SCRIBER produces result with CSV format and names it as 'results.csv'.
disoRDPbind produces result with text format and names it as 'results.txt'.


Second, put the prediction results into the corresponding folders.
The users are suggest to modify the name of results.csv and results.txt respectively
to represent the predictions of different proteins.

For instance, the users can use the following command to calculate
predictions of the protein DP00807.

$ ./ourHybrid.pl DP00807

We are very grateful for bug reports! 
Please contact us at jianzhang@xynu.edu.cn

