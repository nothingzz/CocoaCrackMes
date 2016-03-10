#import <dlfcn.h>
#import <Foundation/Foundation.h>
#import <mach-o/dyld.h>
typedef void(*newNSLog)(NSString* string);
typedef void (*newdlopen)(const char * __path, int __mode);
struct Symbols{
    newdlopen dlopen;
    newNSLog NSLog;
    
};
static void ENC(NSData* input,NSString* key)
{
    //NSMutableString* output = [[NSMutableString alloc] init];
    unsigned char* pBytesInput = (unsigned char*)[input bytes];
    unsigned char* pBytesKey   = (unsigned char*)[[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
    unsigned int vlen = [input length];
    unsigned int klen = [key length];
    unsigned int v = 0;
    unsigned int k = vlen % klen;
    unsigned char c;
    
    for (v; v < vlen; v++) {
        c = pBytesInput[v] ^ pBytesKey[k];
        pBytesInput[v] = c;
        
        k = (++k < klen ? k : 0);
    }
}


int main(int argc, char **argv, char **envp) {
    struct Symbols Sym;
    void* handle = dlopen(NULL, RTLD_GLOBAL | RTLD_NOW);
    NSData* dat=[NSData dataWithBytes:"\x0F\x11\x09\x2C\x26" length:5];
    ENC(dat,@"CAFEBABE");
    
    
    Sym.NSLog=dlsym(handle,dat.bytes);
    Sym.NSLog(@"aaa");
    
    dat=[NSData dataWithBytes:"\x26\x29\x2c\x31\x23\x2b" length:6];
    ENC(dat,@"CAFEBABE");
    Sym.dlopen=dlsym(handle,dat.bytes);
    Sym.dlopen("/System/Library/Frameworks/IOKit.framework/IOKit",RTLD_NOW);
    
    
    
    return 0;
}
// vim:ft=objc
