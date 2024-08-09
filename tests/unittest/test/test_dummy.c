#include "dummy/dummy.h"
#include "unity.h"

void setUp(void) {}
void tearDown(void) {}

void test_dummy(void)
{
    uint8_t rv = dummy_random();
    TEST_ASSERT(rv >= 0 && rv <= 255);
}