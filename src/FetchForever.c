/********************************************************************************
/  Multi Record Example, uses GenericFetchForever.h generic file
/*******************************************************************************/

#include "asciiPlot.h"
#include <stdio.h>
#include <conio.h>
#include <time.h>
#include "GenericFetchForever.h"

#define MAX_STRING_SIZE 50
clock_t initialTime;

FILE *dataFile = NULL;

ViInt32 noFetches = 0;

void main()
{
   // Reset the iteration counter
   initialTime = clock();
   printf("This example will fetch until any key is pressed.\n");
   printf("The screen will be updated everysecond.\n");
   printf("Saving all data to 'waveform_data.bin'...\n");

   printf("Opening a file for writing...\n");
   dataFile = fopen("waveform_data.bin", "wb");
   if (dataFile == NULL)
   {
       printf("Error: Could not open file for writing.\n");
       return;
   }

   // Call the generic function to perform a multi record acquisition
   niScope_GenericFetchForever();

   // Close the file safely after acquisition stops
   if (dataFile != NULL)
   {
       fclose(dataFile);
       dataFile = NULL;
   }
   // Wait and exit
   printf("Acquisition stopped. Data saved successfully.\n");
   printf("Press any key to exit.\n");
   _getch();
}

// Obtain the resource name of the device from the user
int GetResourceNameFromGUI (ViRsrc resourceName)
{
   //Get the device name from the user
   char buffer[MAX_STRING_SIZE];
   printf("Type the device name (e.g., DAQ::1, Dev1, PXI0Slot1, ...)\nfrom Measurement & Automation Explorer [%s]: ", resourceName);
   if (fgets(buffer, sizeof(buffer), stdin) != NULL)
   {
	   if (buffer[0] != '\n')
	   {
		   resourceName = buffer;
	   } else
	   {
		   printf("Accepting Default %s.\n", resourceName);
	   }
   }

   return 0;
}

// Obtain the necessary parameters
int GetParametersFromGUI (ViChar* channel,
                          ViReal64* verticalRange,
						  ViReal64* verticalOffset,
                          ViReal64* minSampleRate,
                          ViInt32* maxPointsFetched)
{
   char buffer[MAX_STRING_SIZE];
   float bufloat;
   strcpy(channel,"0");
   *verticalRange = 10.0;
   *verticalOffset = 0.0;
   *minSampleRate = 25000;
   *maxPointsFetched = 50000;
   
   printf("Specify the range in volts [%.1f]: ", *verticalRange);
   if (fgets(buffer, sizeof(buffer), stdin) != NULL)
   {
	   if (buffer[0] != '\n')
	   {
		   if (sscanf(buffer, "%f", &bufloat) == 1)
		   {
		       *verticalRange = bufloat;
		   } else
		   {
			   printf("Input error. Proceeding with default %.1f.\n", *verticalRange);
		   }
	   } else
	   {
		   printf("Accepting Default %.1f.\n", *verticalRange);
	   }
   }

   printf("Specify the vertical offset in volts [%.1f]: ", *verticalOffset);
   if (fgets(buffer, sizeof(buffer), stdin) != NULL)
   {
	   if (buffer[0] != '\n')
	   {
		   if (sscanf(buffer, "%f", &bufloat) == 1)
		   {
		       *verticalOffset = bufloat;
		   } else
		   {
			   printf("Input error. Proceeding with default %.1f.\n", *verticalOffset);
		   }
	   } else
	   {
		   printf("Accepting default %.1f.\n", *verticalOffset);
	   }
   }

   // Get the sample rate
   printf("Type the device sample rate [%.1f]: ", *minSampleRate);
   if (fgets(buffer, sizeof(buffer), stdin) != NULL)
   {
	   if (buffer[0] != '\n')
	   {
		   if (sscanf(buffer, "%f", &bufloat) == 1)
		   {
		       *minSampleRate = bufloat;
		   } else
		   {
			   printf("Input error. Proceeding with default %.1f.\n", *minSampleRate);
		   }
	   } else
	   {
		   printf("Accepting default %.1f.\n", *minSampleRate);
	   }
   }

   return 0;
}

// Display message - do a printf
int DisplayErrorMessageInGUI (ViInt32 error,
                              ViConstString errorMessage)
{

   printf("%s\n",errorMessage);
   return 0;
}

// Save waveforms to a binary file
int PlotWfms (ViInt8 *waveformPtr,
              struct niScope_wfmInfo *wfmInfoPtr,
              ViInt32 totalPointsFetched)
{
   clock_t currentTime;
   currentTime = clock();
   noFetches += 1;
   
   if (waveformPtr && wfmInfoPtr && dataFile)
   {
      // 1. Write the fetched samples to the binary file immediately
      ViInt32 samplesToSave = wfmInfoPtr[0].actualSamples;
      fwrite(waveformPtr, sizeof(ViInt8), samplesToSave, dataFile);

      // 2. Throttle the console output so it only updates once per second
      currentTime = clock();
      if ((double)(currentTime - initialTime) / CLOCKS_PER_SEC > 1)
      {
         initialTime = currentTime;
         // Display the points fetched to the screen
         printf("Total points saved so far : %d\n", totalPointsFetched);
		 printf("Last number fetched: %d\n", samplesToSave);
		 printf("Number of fetches: %d\n", noFetches);
		 printf("Sample rate: %d\n", noFetches * samplesToSave);
		 noFetches = 0;

      }
   }
   return 0;
}

// Return true to stop after the first acquisition
int ProcessEvent (int *stopPtr)
{
   // Stop when keyboard is pressed
   if (_kbhit())
   {
      *stopPtr = VI_TRUE;
      getch();
   }
   else
      *stopPtr = VI_FALSE;
   return 0;
}


/*************************************************************************************\

                              End of example

\*************************************************************************************/
