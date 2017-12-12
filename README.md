# A systematic approach to detect damage through Machine Learning/ Statistical Pattern Recognition (SPR) paradigm.
### Under Guidance of Prof. Amit Shelke
**Data based** approaches are espoused as suggested by _CR Farrar and K Worden_ in their book _“Structural Health Monitoring – A Machine Learning Prospective”._

Two methodologies are demonstrated over here for damage detection:
1)	Using Support Vector Machines
2)	Using K Means -- algorithm 

Both the approaches are applied to the synthetically generated 3D Gaussian clusters (for demonstration purpose). In actual experiments these clusters are obtained after several procedures (discussed later) on **Acoustic Emission (AE)** data. Data used was obtained from several shock tube experiments at the _NDT (Non Destructive Testing) Lab, IIT Guwahati, India._

The image of shock tube and three-DOF shear building is shown below:


[![shock_tube.jpg](https://s19.postimg.org/pedbxjisj/shock_tube.jpg)](https://postimg.org/image/jq716nefz/) [![shear_building.jpg](https://s19.postimg.org/8131iofrn/shear_building.jpg)](https://postimg.org/image/qtewm9c5r/)



### Procedures on Acoustic Emission (AE) data.
1)  Data Normalisation.	
2)  Signal Processing to remove random signal.
2)	Plotting of acceleration data of one floor w.r.t that of another floors to form clusters.

A typical AE data and cluster is shown below:


[![AE_signal.jpg](https://s19.postimg.org/az00c2xmb/AE_signal.jpg)](https://postimg.org/image/n0ve686un/)  [![cluster.jpg](https://s19.postimg.org/7s5gsg5gj/cluster.jpg)](https://postimg.org/image/kjjmyyf8f/)

**Further processes are given in readme files in each folder.**

  
