#include <iostream>
using namespace std;

const int SIZE{8};

class BinaryNumber {
private:
    bool* ptr{};
public:
    BinaryNumber(): ptr{new bool[SIZE]} {}
    BinaryNumber(int x): ptr{new bool[SIZE]} {
        int index = SIZE - 1;
        while (x)
        {
            ptr[index--] = (x % 2);
            x /= 2;
        }
    }
    BinaryNumber(const BinaryNumber& other) : ptr{new bool[SIZE]} {
        for (int i = 0; i < SIZE; i++) {
            ptr[i] = other.ptr[i];
        }
    }
    ~BinaryNumber() { if (ptr) delete[] ptr; }

    friend ostream& operator << (ostream& os, const BinaryNumber& obj) {
        if (obj.ptr)
        {
            for (int i = 0; i < SIZE; i++)
            {
                os << obj.ptr[i];
            }
        }
        return os;
    }
    BinaryNumber operator + (bool x) const {
        BinaryNumber result(*this);
        bool carry = x;
        for (int i = SIZE - 1; i >= 0; i--)
        {
            if (result.ptr[i] == 0 && carry)
            {
                result.ptr[i] = 1;
                carry = false;
            }
            else if (result.ptr[i] == 1 && carry)
            {
                result.ptr[i] = 0;
            }
        }
        return result;
    }
    BinaryNumber operator~() const {
        BinaryNumber result(*this);
        for (int i = 0; i < SIZE; i++)
        {
            result.ptr[i] = !result.ptr[i];
        }
        return result;
    }
    void setNumber(int num) {
        if (!ptr) ptr = new bool[SIZE];
        if (num < 0) num *= -1;
        int index = SIZE - 1;
        while (num)
        {
            ptr[index--] = (num % 2);
            num /= 2;
        }
    }
    BinaryNumber setBit(int index, bool value)
    {
        if (index < 0 || index >= SIZE) return *this;
        BinaryNumber result{*this};
        result.ptr[index] = value;
        return result;
    }
};

class Solution {
private:
    int DecimalNum{};
    BinaryNumber BinaryNum{};
    bool isNegative{};
public:
    Solution(int num): DecimalNum{num}, isNegative{num < 0} {
        if (isNegative) DecimalNum *= -1;
        BinaryNum.setNumber(DecimalNum);
    };
    void a() {
        cout << "Output a: ";
        if (DecimalNum >= 128)
        {
            cout << "overflow\n";
            return;
        } 
        if (DecimalNum == 0) cout << "10000000 & ";
        cout << BinaryNum.setBit(0, isNegative) << "\n";
    }
    void b() {
        cout << "Output b: ";
        if (DecimalNum >= 128)
        {
            cout << "overflow\n";
            return;
        } else if (!isNegative) {
            if (DecimalNum == 0) cout << "11111111 & ";
            cout << BinaryNum << endl;
        } else {
            BinaryNumber result{~BinaryNum};
            cout << result << "\n";
        }
    }
    void c() {
        cout << "Output c: ";
        if (DecimalNum > 128 || (!isNegative && DecimalNum >= 128))
        {
            cout << "overflow\n";
            return;
        } else if (!isNegative) {
            cout << BinaryNum << endl;
        } else {
            BinaryNumber result{~BinaryNum + 1};
            cout << result << "\n";
        }
    }
};

int main()
{
    int x{};
    cin >> x;
    Solution s{x};
    s.a();
    s.b();
    s.c();
}