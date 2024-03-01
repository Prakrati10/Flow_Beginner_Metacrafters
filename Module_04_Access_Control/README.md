## Objective 

You will have 4 variables (a, b, c, d) and 3 functions (publicFunc, contractFunc, privateFunc) defined in SomeContract.

In each AREA (1, 2, 3, and 4), do the following in your code walk through:

for each variable (a, b, c, and d), say in which areas they can be read (read scope) and which areas they can be modified (write scope)
for each function (publicFunc, contractFunc, and privateFunc), simply share where they can be called

```cadence
access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}

        access(contract) fun contractFunc() {}

        access(self) fun privateFunc() {}


        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
```

## Short Summar Of Explanation 

A system of access control and visibility modifiers for variables in different areas of a program. Let's break down the explanation:

```
Area 01 (Struct): This area likely refers to the structured data or components of the program.
Area 02 (Resource): Resources often denote external entities or assets that the program interacts with or manages.
Area 03 (Functions): This area probably pertains to the functions or methods within the program.
Area 04 (Script): Scripts typically represent executable code segments that control the program's behavior.
```

**Now, let's delve into the access modifiers:**

pub(set): This modifier allows reading or writing of a variable from anywhere in the program, including all four areas (Struct, Resource, Functions, and Script).
pub: With this modifier, the variable's value can be read from any area (Struct, Resource, Functions, and Script), but it can only be written from Area 01 (Struct).
access(contract): Variables marked with this modifier can be read from Areas 01, 02, and 03, but they can only be written from Area 01 (Struct).
access(self): Variables tagged with this modifier can be both read and written to only from Area 01 (Struct).

**In summary:**

```
pub(set): Read and write from anywhere.
pub: Read from anywhere, write only from Area 01.
access(contract): Read from Areas 01, 02, and 03, write only from Area 01.
access(self): Read and write only from Area 01.
```
