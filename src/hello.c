#include <jni.h>
#include "Main.h"
#include <stdio.h>

JNIEXPORT
void JNICALL Java_Main_hello(JNIEnv* env, jobject obj, jstring name){
  const char *str;
  str = (*env)->GetStringUTFChars(env, name, NULL);
  if (str == NULL) {
    return;
  }

  printf("Hello World! %s \n", str );
  return;
}
