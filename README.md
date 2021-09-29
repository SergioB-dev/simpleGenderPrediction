# Troubleshooting

## Expected

Once the `Get JSON` button is tapped, it should present a new view modally and change the text of that label.

## Actual Results

The label is not being updated

## Observations

This implementation of the PD Pattern is a little differnt from what we implemented the first time with the Animal / Emoji app. 
Instead of passing the data while dismissing a view, I am now passing data while ** presenting ** a view. So my implementation is wrong somehow..
