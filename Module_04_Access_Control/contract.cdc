access(all) contract SomeContract {

    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        // Area 01 ( Struct ), Area 02 ( Resource ), Area 03 ( Functions), and Area 04 ( Script )

        // pub(set) - we can read or write a variable from everywhere, like area 1, 2,3, and 4 
        // pub - We can read to the value of this variable from Area 1, 2, 3, and 4 and we can write only from area 1
        // access(contract) - we can read to the value of this variable from 1,2, and 3 and we can write only from area 1
        // access(self) - we can read & write to the value of this variable only from area 1


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
