#include "testLib.h"

#include <gtest/gtest.h>

TEST(TmpAddTest, CheckValues)
{
    ASSERT_EQ(testlib::add(1, 2), 3);
    EXPECT_TRUE(true);
}

int main(int argc, char ** argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}