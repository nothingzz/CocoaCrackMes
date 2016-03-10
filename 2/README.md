##What Happened
>>We Modified Address,offset and size of __TEXT/__cstring

>>Hopper Can No Longer Recognize Them

>>Previously. By using Segment Overlapping, we can make Hopper/IDA disassemble our string constants.

**Unfortunately This method has been killed since dyld improved boundary check and Certain Segment Overlapped Binary will be killed by dyld On-Sight**

**: (  Oooops**
