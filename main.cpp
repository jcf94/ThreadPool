/* ***********************************************
MYID    : Chen Fan
LANG    : G++
PROG    : MAIN
************************************************ */

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <algorithm>

#include <chrono>

#include "src/ThreadPool.h"

using namespace std;

class A
{
public:
    A(int x)
        : data(x) {}
    
    void outp()
    {
        cout << data << endl;
    }

    int data;
};

int main()
{
    ThreadPool pool(4);

    for (int i=0;i<10;i++)
    pool.add_task([i]()
    {
        printf("Hello World: %d\n", i);
        //this_thread::sleep_for(chrono::seconds(2));
    });

    A aaa(100);
    A* bbb = new A(20);

    aaa.outp();
    bbb->outp();

    pool.add_task([&aaa]()
    {
        aaa.outp();
    });

    pool.add_task([bbb]()
    {
        bbb->outp();
    });

    // pool.wait();
    
    return 0;
}